SET query_group TO 'ingest';

CREATE TEMPORARY TABLE invtrans_tmp (LIKE invtranschain.invtrans);

COPY invtrans_tmp FROM '{0}' IAM_ROLE '{1}' csv ignoreheader 1 region '{2}' gzip;

INSERT INTO invtranschain.invtrans SELECT * FROM invtrans_tmp;

DROP TABLE invtrans_tmp;