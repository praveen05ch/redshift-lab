SET query_group TO 'ingest';

CREATE TEMPORARY TABLE supply_tmp (LIKE supplychain.supply);

COPY supply_tmp FROM '{0}' IAM_ROLE '{1}' csv ignoreheader 1 region '{2}' gzip;

INSERT INTO supplychain.supply SELECT * FROM supply_tmp;

DROP TABLE supply_tmp;