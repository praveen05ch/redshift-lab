SET query_group TO 'ingest';

CREATE TEMPORARY TABLE otd_tmp (LIKE supplychain.otd);

COPY otd_tmp FROM '{0}' IAM_ROLE '{1}' csv ignoreheader 1 region '{2}' gzip;

INSERT INTO supplychain.otd SELECT * FROM otd_tmp;

DROP TABLE otd_tmp;