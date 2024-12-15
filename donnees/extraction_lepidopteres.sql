---------------------------------
-- Extraction depuis ATLAS
---------------------------------
select observed_scientific_name,
    valid_scientific_name,
    taxa.rank,
    vernacular_fr,
    kingdom,
    phylum,
    class,
    "order",
    family,
    genus,
    species,
    year_obs,
    month_obs
    day_obs,
    time_obs,
    dwc_event_date,
    variables.name as obs_variable,
    variables.unit as obs_unit,
    obs_value,
    ST_Y(geom) as lat,
    ST_X(geom) as lon
from observations
LEFT JOIN taxa_obs ON taxa_obs.id = observations.id_taxa_obs
LEFT JOIN api.taxa ON taxa.id_taxa_obs = taxa_obs.id
LEFT JOIN variables ON variables.id = observations.id_variables
LEFT JOIN datasets ON datasets.id = observations.id_datasets
where "order" ilike 'Lepidoptera'
and open_data is true
