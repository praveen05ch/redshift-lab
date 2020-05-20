SET query_group TO 'ingest';

CREATE TEMPORARY TABLE customer_tmp (LIKE supplychain.customer);

COPY customer_tmp FROM '{0}' IAM_ROLE '{1}' csv ignoreheader 1 region '{2}' gzip;

INSERT INTO supplychain.customer SELECT * FROM customer_tmp;

DROP TABLE customer_tmp;