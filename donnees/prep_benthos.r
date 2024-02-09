#==============================================================================
# Prepares the data for the benthos dataset.
#
# NOTES:
# - The data is read from the benthos_df.csv file.
# - The data is split into distinct dataframes using the combination of site_id and date_obs.
# - The time_obs column is formatted to xxhxx.xx for date_obs containing 2016|2018|2020.
# - The data is saved in the donnees/acoustique_oiseaux folder using the following naming convention: site_site_id_date_obs.csv
#==============================================================================

library("dplyr")
benthos <- read.csv("donnees/extraction_benthos.csv", header = TRUE) # Données de injection_notes (benthos_df.csv)


benthos_sub <- subset(benthos, select = c("campaigns_opened_at", "sites_site_code", "observations_date_obs", "observations_time_obs","efforts_fraction_benthos", "obs_species_taxa_name", "obs_species_value", "environnements_extra_value_1", "environnements_extra_value_2", "environnements_extra_value_3", "environnements_extra_value_4", "environnements_extra_value_5")) |>
    glimpse()

names(benthos_sub) <- c("date", "site", "date_obs", "heure_obs", "fraction", "nom_sci", "abondance", "largeur_riviere", "profondeur_riviere", "vitesse_courant", "transparence_eau", "temperature_eau_c")

sites <- read.csv("donnees/extraction_sites.csv")
benthos_sub <- benthos_sub |>
    left_join(sites, by = c("site" = "site_code")) |>
    rename(lat = st_y) |>
    glimpse()

# change heure_obs format to xxhxx.xx for date_obs containing 2016, 2018 or 2020
benthos_sub <- benthos_sub |>
    mutate(heure_obs = ifelse(grepl("2016|2018|2020", date_obs), format(as.POSIXct(heure_obs, format = "%H:%M:%S"), "%Hh%M.%S"), heure_obs)) |>
    glimpse()

# Add station information using donnees/sitesBdQc_benthos.xlsx file
station <- readxl::read_excel("donnees/sitesBdQc_benthos.xlsx") |>
    select(SITE_BDQC, ETIQSTATION) |>
    glimpse()
habitat <- readxl::read_excel("donnees/20230622_BdQC2016-2021_pourBdQc _version Victor.xlsx", sheet = 2) |>
    select(ETIQSTATION, RIVIERE_TOPO, NIVEAU, CRG_ROC, CRG_SOL, CRG_HER, CRD_ROC, CRD_SOL, CRD_HER, ESUB_ALG, ESUB_MOU, ESUB_AUT, TEMP, `1_SUBSTRAT_ABRI`, `2_SABLE_VASE`, `3_VELOCITE`, `4_SEDIMENT`, REMARQUE) |>
    glimpse()
benthos_sub <- benthos_sub |> 
    left_join(station, by = c("site" = "SITE_BDQC")) |>
    left_join(habitat, by = c("ETIQSTATION" = "ETIQSTATION")) |>
    glimpse()

# Split data into distinct dataframes using the combination of site_id and date_obs.
data <- benthos_sub |>
  dplyr::group_by(site, date_obs) |>
  dplyr::mutate(file_name = paste0("donnees/benthos/site_", site, "_", date_obs, ".csv")) |>
  dplyr::ungroup() |>
  dplyr::glimpse()

dat_list <- data |>
    dplyr::group_split(file_name)

lapply(dat_list, function(x) {
    file_name <- x$file_name[1]
    x <- dplyr::select(x, -file_name)
    write.csv(x, file_name, row.names = FALSE)
    }
)