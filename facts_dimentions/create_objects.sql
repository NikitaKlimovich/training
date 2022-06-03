create database sales_cars;
use sales_cars;

create table DIM_CAR (
SK_CAR		int identity(1,1) primary key,
Vin_code	varchar(30),
Model		varchar(30),
Issue_year	int,
Brend		varchar(50),
Effective	date,
Expired		date,
Is_Current	bit
);

create unique index vin_code on DIM_CAR(Vin_code, Model, Issue_year, Brend);


create table DIM_MANAGER (
SK_MANAGER	int identity(1,1) primary key,
Emp_code	varchar(30),
FIRSTNAME	varchar(30),
LASTNAME	varchar(30),
DEPT		varchar(30),
Hire_date	date,
Effective	date,
Expired		date,
Is_Current	bit
);



create unique index emp_code on DIM_MANAGER(Emp_code,FIRSTNAME,LASTNAME,DEPT,Hire_date);


create table DIM_DATE (
SK_Sales_date	int identity(1,1) primary key,
Date_ID			int,
Month			int,
Day_of_week		int,
Quarter			int,
Week_of_year	int,
isHol			bit
);

create unique index date_id on DIM_DATE(Date_ID);

create table DIM_CLIENT (
SK_Client	int identity(1,1) primary key,
Pass_code	varchar(30),
FIRSTNAME	varchar(30),
LASTNAME	varchar(30),
BIRTHDAY	date,
TEL			varchar(20),
CITY		varchar(30),
EMAIL		varchar(30),
Effective	date,
Expired		date,
Is_Current	bit
);

create unique index pass_code on DIM_CLIENT(Pass_code,FIRSTNAME,LASTNAME,BIRTHDAY,TEL,CITY,EMAIL);


create table DIM_SHOW_ROOM (
SK_Show_room	int identity(1,1) primary key,
SHOW_ROOM_NAME	varchar(30),
CITY			varchar(30),
STREET			varchar(30),
BUILDING		varchar(30),
PREVIOUS_TEL	varchar(20),
CURRENT_TEL		varchar(20),
EFFECTIVE_DATE	date
);


create unique index room_name on DIM_SHOW_ROOM (SHOW_ROOM_NAME,CITY,STREET,BUILDING,CURRENT_TEL);


create table DIM_STORAGE (
SK_STORAGE			int identity(1,1) primary key,
STORAGE_ID			int,
CITY				varchar(30),
STREET				varchar(30),
BUILDING			varchar(30),
TEL					varchar(20),
PARKING_LOT_COUNT	int,
AREA				float
);

create unique index storage_id on DIM_STORAGE (CITY,STREET,BUILDING,TEL);


create table FACT_SALES (
SK_Car			int,
SK_Client		int,
SK_Manager		int,
SK_Sales_date	int,
SK_Show_room	int,
Price float,
foreign key (SK_Car) references DIM_CAR(SK_CAR),
foreign key (SK_Client) references DIM_CLIENT(SK_Client),
foreign key (SK_Manager) references DIM_MANAGER(SK_Manager),
foreign key (SK_Sales_date) references DIM_DATE(SK_Sales_date),
foreign key (SK_Show_room) references DIM_SHOW_ROOM(SK_Show_room)
);

create unique index sales on FACT_SALES (SK_Car,SK_Client,SK_Manager,SK_Sales_date,SK_Show_room);
create index price on FACT_SALES (Price);

create table FACT_STORAGE_SNAPSHOT (
SK_Car				int,
SK_STORAGE			int,
SK_SNAPSHOT_DATE	int,
DAYS_ON_STORAGE		int,
foreign key (SK_Car) references DIM_CAR(SK_CAR),
foreign key (SK_STORAGE) references DIM_STORAGE(SK_STORAGE),
foreign key (SK_SNAPSHOT_DATE) references DIM_DATE(SK_Sales_Date)
);

create unique index storage_snapshot on FACT_STORAGE_SNAPSHOT (SK_Car,SK_STORAGE,SK_SNAPSHOT_DATE);
create index days_on_storage on FACT_STORAGE_SNAPSHOT(DAYS_ON_STORAGE);

create table FACT_SALES_PIPELINE (
SK_Car						int,
SK_Client					int,
SK_STORAGE					int,
SK_MF_ORDER_DATE			int,
SK_ST_DELIVERY_DATE			int,
SK_CLIENT_ORDER_DATE		int,
SK_CLIENT_DELIVERY_DATE		int,
MF_PRICE					float,
DAYS_BTW_CLNT_ORDER_DLVRY	int,
foreign key (SK_Car) references DIM_CAR(SK_CAR),
foreign key (SK_Client) references DIM_CLIENT(SK_Client),
foreign key (SK_STORAGE) references DIM_STORAGE(SK_STORAGE),
foreign key (SK_MF_ORDER_DATE) references DIM_DATE(SK_Sales_Date),
foreign key (SK_ST_DELIVERY_DATE) references DIM_DATE(SK_Sales_Date),
foreign key (SK_CLIENT_ORDER_DATE) references DIM_DATE(SK_Sales_Date),
foreign key (SK_CLIENT_DELIVERY_DATE) references DIM_DATE(SK_Sales_Date)
);

create unique index sales_pipeline on FACT_SALES_PIPELINE (SK_Car,SK_Client,SK_STORAGE,SK_MF_ORDER_DATE,SK_ST_DELIVERY_DATE,SK_CLIENT_ORDER_DATE,SK_CLIENT_DELIVERY_DATE);
create index mf_price on FACT_SALES_PIPELINE (MF_PRICE);
create index days_btw_clnt_order_dlvry on FACT_SALES_PIPELINE (DAYS_BTW_CLNT_ORDER_DLVRY);




