SET query_group TO 'ingest';

CREATE SCHEMA supplychain;

CREATE EXTERNAL SCHEMA spectrum_schema FROM DATA CATALOG database 'default' region '{0}'  iam_role '{1}';

CREATE TABLE supplychain.date (
	CalendarDate	date,
	WeekName		varchar(2),
	WeekStartDate	date,
	WeekEndDate		date,
	Month			varchar(3),
	MonthName		varchar(6),
	MonthNum		smallint,
	QuarterName		varchar(2),
	Year			smallint,
	MonthStartDate	date,
	MonthEndDate	date,
	PreviousYear	smallint
	);
	
CREATE TABLE supplychain.item (
	ItemID			smallint,
	OrgID			bigint,
	ItemNum			varchar(10),
	ItemName		varchar(50),
	Category		varchar(20),
	UOM				varchar(10),
	UnitPrice		decimal(10,2),
	MinOrderQty		smallint
	);
	
CREATE TABLE supplychain.org (
	OrgID			bigint,
	OrgNum			smallint,
	OrgName			varchar(30)
	);
	
CREATE TABLE supplychain.customer (
	CustomerName	varchar(100),
	CustomerNumber	bigint,
	CustomerType	varchar(30)
	);
	
CREATE TABLE supplychain.salesorders (
	CustomerNumber	bigint,
	CustomerName	varchar(100),
	OrgNum			smallint,
	OrgName			varchar(30),
	Category		varchar(20),
	ItemID			smallint,
	ItemNum			varchar(10),
	Week			date,
	OrderedQty		smallint,
	StockOnHand		smallint,
	OpenOrders		smallint,
	OrderAmount		decimal(22,7)
	);

CREATE TABLE supplychain.otd (
	ItemID			smallint,
	ItemNum			varchar(10),
	Week			date,
	CustomerNumber	bigint,	
	CustomerName	varchar(100),	
	OrderedQty		smallint,
	OnTimeDelivery	decimal(10,5),
	BacklogQty		smallint,
	ExpectedDate	date
	);

CREATE TABLE supplychain.demand (
	ItemID			smallint,
	ItemNum			varchar(10),
	Week			date,
	RequestedQty	smallint,
	DlqntBacklog	smallint,
	ForecastedSales	smallint,
	TotalDemand		smallint,
	Source			varchar(20)
	);
	
CREATE TABLE supplychain.supply (
	ItemID				smallint,
	ItemNum				varchar(10),
	Week				date,
	InTransit			smallint,
	ScheduledReceipts	smallint,
	OpenPOs				smallint,
	PlannedOrders		smallint,
	WorkOrders			smallint,
	ProjectedAvail		smallint,
	Source				varchar(20)
	);
	
CREATE TABLE supplychain.invtrans (
	ItemID				smallint,
	ItemNum				varchar(10),
	Week				date,
	AvailableQty		smallint,
	Bookings			smallint,
	PurchaseOrders		smallint,
	WorkOrders			smallint,
	ExcessAvailable		smallint,
	InventoryDaysOH		smallint,
	InventoryTurnover	smallint
	);

