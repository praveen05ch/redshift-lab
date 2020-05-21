SET query_group TO 'ingest';

CREATE TEMPORARY TABLE org_tmp (LIKE supplychain.org);

COPY org_tmp FROM '{0}' IAM_ROLE '{1}' csv ignoreheader 1 region '{2}' ;

INSERT INTO supplychain.org SELECT * FROM org_tmp;

DROP TABLE org_tmp;