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
    years,
    unit,
    values,
    ST_AsText(geom) as geom,
    original_source,
    creator,
    title,
    publisher,
    intellectual_rights,
    license,
    owner
from time_series
LEFT JOIN datasets ON datasets.id = time_series.id_datasets
LEFT JOIN api.taxa ON taxa.id_taxa_obs = time_series.id_taxa_obs
where open_data is true
