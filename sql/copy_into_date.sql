SET query_group TO 'ingest';

CREATE TEMPORARY TABLE date_tmp (LIKE supplychain.date);

COPY date_tmp FROM '{0}' IAM_ROLE '{1}' csv ignoreheader 1 region '{2}' gzip;

INSERT INTO supplychain.date SELECT * FROM date_tmp;

DROP TABLE date_tmp;