SET query_group TO 'ingest';

CREATE TEMPORARY TABLE demand_tmp (LIKE supplychain.demand);

COPY demand_tmp FROM '{0}' IAM_ROLE '{1}' csv ignoreheader 1 region '{2}' gzip;

INSERT INTO supplychain.demand SELECT * FROM demand_tmp;

DROP TABLE demand_tmp;