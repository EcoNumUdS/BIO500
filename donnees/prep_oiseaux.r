#==============================================================================
# Prepares the data for the oiseaux dataset.
#
# NOTES:
# - The data is read from the donnees/extraction_oiseaux.csv file.
# - The data is split into distinct dataframes using the combination of site_id and date_obs.
# - The date_obs column is formatted to d/m/y for date_obs containing 2016 or 2017.
# - The data is saved in the donnees/acoustique_oiseaux folder using the following naming convention: site_site_id_date_obs.csv
#==============================================================================

data <- read.csv("donnees/extraction_oiseaux.csv") |>
    dplyr::glimpse()

# Split data into distinct dataframes using the combination of site_id and date_obs.
data <- data |>
  dplyr::group_by(site_id, date_obs) |>
  dplyr::mutate(file_name = paste0("donnees/acoustique_oiseaux/site_", site_id, "_", date_obs, ".csv")) |>
  dplyr::ungroup() |>
  dplyr::glimpse

## Change date_obs y-m-d formating to d/m/y for date_obs containing 2016 or 2017
data <- data |>
  dplyr::mutate(date_obs = ifelse(grepl("2016|2017", date_obs), format(as.Date(date_obs), "%d/%m/%Y"), date_obs)) |>
  dplyr::glimpse()

## Save the data in the donnees/acoustique_oiseaux folder using the following naming convention: site_site_id_date_obs.csv
dat_list <- data |>
    dplyr::group_split(file_name)

lapply(dat_list, function(x) {
    file_name <- x$file_name[1]
    x <- dplyr::select(x, -file_name)
    write.csv(x, file_name, row.names = FALSE)
    }
)
