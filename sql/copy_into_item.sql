SET query_group TO 'ingest';

CREATE TEMPORARY TABLE item_tmp (LIKE supplychain.item);

COPY item_tmp FROM '{0}' IAM_ROLE '{1}' csv ignoreheader 1 region '{2}' ;

INSERT INTO supplychain.item SELECT * FROM item_tmp;

DROP TABLE item_tmp;