SET query_group TO 'ingest';

CREATE TEMPORARY TABLE salesorders_tmp (LIKE supplychain.salesorders);

COPY salesorders_tmp FROM '{0}' IAM_ROLE '{1}' csv ignoreheader 1 region '{2}' gzip;

INSERT INTO supplychain.salesorders SELECT * FROM salesorders_tmp;

DROP TABLE salesorders_tmp;