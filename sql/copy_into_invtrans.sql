SET query_group TO 'ingest';

CREATE TEMPORARY TABLE invtrans_tmp (LIKE supplychain.invtrans);

COPY invtrans_tmp FROM '{0}' IAM_ROLE '{1}' csv ignoreheader 1 region '{2}' gzip;

INSERT INTO supplychain.invtrans SELECT * FROM invtrans_tmp;

DROP TABLE invtrans_tmp;