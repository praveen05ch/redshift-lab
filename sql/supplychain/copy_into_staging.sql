SET query_group TO 'ingest';

CREATE TEMPORARY TABLE nyc_greentaxi_tmp (LIKE supplychain.nyc_greentaxi);

COPY nyc_greentaxi_tmp FROM '{0}' IAM_ROLE '{1}' csv ignoreheader 1 region '{2}' gzip;

DELETE FROM supplychain.nyc_greentaxi USING nyc_greentaxi_tmp WHERE supplychain.nyc_greentaxi.vendorid = nyc_greentaxi_tmp.vendorid AND supplychain.nyc_greentaxi.lpep_pickup_datetime = nyc_greentaxi_tmp.lpep_pickup_datetime;

INSERT INTO supplychain.nyc_greentaxi SELECT * FROM nyc_greentaxi_tmp;

DROP TABLE nyc_greentaxi_tmp;