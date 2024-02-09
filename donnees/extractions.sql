---------------------------------------------------------------------
-- Acoustique oiseaux
---------------------------------------------------------------------

select site_id,
    ST_Y(s.geom) as lat,
    time_start,
    time_finish,
    date_obs,
    time_obs,
    variable,
    valid_scientific_name,
    rank,
    vernacular_en,
    vernacular_fr,
    kingdom, phylum, class, "order", family, genus, species
from campaigns c, 
    sites s,
    observations o, 
    observations_efforts_lookup el, 
    efforts e, 
    obs_species os,
    api.taxa t
where c.id = o.campaign_id
    and s.id = c.site_id
    and el.observation_id = o.id
    and e.id = el.effort_id
    and o.id = os.observation_id
    and os.id_taxa_obs = t.id_taxa_obs
    and c.type = 'acoustique_oiseaux';

