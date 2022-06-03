-- Second day
use sales_cars;

update DIM_CAR set Expired = '2022-06-01', Is_Current=0 where Vin_code = 'AC-3872' and Is_Current = 1;

insert into DIM_CAR (Vin_code, Model, Issue_year, Brend, Effective, Expired, Is_Current)
values ('AC-3872', 'BMW-2022', 2016, 'BMWLuxury Vehicles1916-Present', '2022-06-02', '9999-12-31',1);

update DIM_CAR set Expired = '2022-06-01', Is_Current=0 where Vin_code = 'BX-4011' and Is_Current = 1;

insert into DIM_CAR (Vin_code, Model, Issue_year, Brend, Effective, Expired, Is_Current)
values ('BX-4011', 'Volvo', 2010, 'HondaMass-Market Cars1948-Present', '2022-06-02', '9999-12-31',1);

update DIM_CAR set Expired = '2022-06-01', Is_Current=0 where Vin_code = 'II-0999' and Is_Current = 1;

insert into DIM_CAR (Vin_code, Model, Issue_year, Brend, Effective, Expired, Is_Current)
values ('II-0999', 'Ford', 2012, 'ToyotaMass-Market', '2022-06-02', '9999-12-31',1);





update DIM_MANAGER set Expired = '2022-06-01', Is_Current=0 where Emp_code = '9k001' and Is_Current = 1;

insert into DIM_MANAGER (Emp_code, FIRSTNAME, LASTNAME, DEPT, Hire_date, Effective, Expired, Is_Current)
values ('9k001', 'Artem', 'Zheldak', 'A00', '2009-06-20', '2022-06-02', '9999-12-31',1);

update DIM_MANAGER set Expired = '2022-06-01', Is_Current=0 where Emp_code = '9k002' and Is_Current = 1;

insert into DIM_MANAGER (Emp_code, FIRSTNAME, LASTNAME, DEPT, Hire_date, Effective, Expired, Is_Current)
values ('9k002', 'Nikita', 'Zhukov', 'A00', '2013-08-03', '2022-06-02', '9999-12-31',1);

update DIM_MANAGER set Expired = '2022-06-01', Is_Current=0 where Emp_code = '8k002' and Is_Current = 1;

insert into DIM_MANAGER (Emp_code, FIRSTNAME, LASTNAME, DEPT, Hire_date, Effective, Expired, Is_Current)
values ('8k002', 'Alina', 'Parhomova', 'A02', '2012-06-27', '2022-06-02', '9999-12-31',1);



insert into DIM_DATE (Date_ID, Month, Day_of_week, Quarter, Week_of_year, isHol)
values (8, 4, 2, 1, 17, 1);

insert into DIM_DATE (Date_ID, Month, Day_of_week, Quarter, Week_of_year, isHol)
values (9, 7, 2, 2, 30, 1);

insert into DIM_DATE (Date_ID, Month, Day_of_week, Quarter, Week_of_year, isHol)
values (10, 1, 1, 1, 1, 0);




update DIM_CLIENT set Expired = '2022-06-01', Is_Current=0 where Pass_code = '207182' and Is_Current = 1;

insert into DIM_CLIENT (Pass_code,FIRSTNAME,LASTNAME,BIRTHDAY,TEL,CITY,EMAIL,Effective, Expired,Is_Current)
values ('207182', 'Yulia', 'Kosobutskaya', '2001-07-01', '+375293097820', 'Minsk', 'kosulya@mail.ru', '2022-06-02', '9999-12-31',1);

update DIM_CLIENT set Expired = '2022-06-01', Is_Current=0 where Pass_code = '220989' and Is_Current = 1;

insert into DIM_CLIENT (Pass_code,FIRSTNAME,LASTNAME,BIRTHDAY,TEL,CITY,EMAIL,Effective, Expired,Is_Current)
values ('220989', 'Alina', 'Bojko', '2001-01-11', '+375292013431', 'Minsk', 'aliboj@mail.ru', '2022-06-02', '9999-12-31',1);

update DIM_CLIENT set Expired = '2022-06-01', Is_Current=0 where Pass_code = '209834' and Is_Current = 1;

insert into DIM_CLIENT (Pass_code,FIRSTNAME,LASTNAME,BIRTHDAY,TEL,CITY,EMAIL,Effective, Expired,Is_Current)
values ('209834', 'Timofey', 'Bulatov', '2000-05-13', '+375296754343', 'Bobrujsk', 'bulat@mail.ru', '2022-06-02', '9999-12-31',1);




update DIM_SHOW_ROOM set PREVIOUS_TEL = '+375336012087', CURRENT_TEL = '+37533222222', EFFECTIVE_DATE = '2022-06-02' where SHOW_ROOM_NAME = 'Room_1';

update DIM_SHOW_ROOM set PREVIOUS_TEL = '+375290019022', CURRENT_TEL = '+375295092351', EFFECTIVE_DATE = '2022-06-02' where SHOW_ROOM_NAME = 'Room_2';

update DIM_SHOW_ROOM set PREVIOUS_TEL = '+375292014455', CURRENT_TEL = '+375296196575', EFFECTIVE_DATE = '2022-06-02' where SHOW_ROOM_NAME = 'Room_4';





update DIM_STORAGE set PARKING_LOT_COUNT=151 where STORAGE_ID = 1;

update DIM_STORAGE set PARKING_LOT_COUNT=381 where STORAGE_ID = 3;

update DIM_STORAGE set PARKING_LOT_COUNT=111 where STORAGE_ID = 4;






insert into FACT_SALES (SK_Car,SK_Client,SK_Manager,SK_Sales_date,SK_Show_room,Price)
values (3,4,1,8,2,343.7);

insert into FACT_SALES (SK_Car,SK_Client,SK_Manager,SK_Sales_date,SK_Show_room,Price)
values (1,4,2,10,2,344.1);

insert into FACT_SALES (SK_Car,SK_Client,SK_Manager,SK_Sales_date,SK_Show_room,Price)
values (2,4,4,9,2,208.5);







insert into FACT_STORAGE_SNAPSHOT (SK_Car,SK_STORAGE,SK_SNAPSHOT_DATE,DAYS_ON_STORAGE)
values (3,2,9,11);

insert into FACT_STORAGE_SNAPSHOT (SK_Car,SK_STORAGE,SK_SNAPSHOT_DATE,DAYS_ON_STORAGE)
values (1,1,8,1);

insert into FACT_STORAGE_SNAPSHOT (SK_Car,SK_STORAGE,SK_SNAPSHOT_DATE,DAYS_ON_STORAGE)
values (4,3,9,15);






insert into FACT_SALES_PIPELINE (SK_Car,SK_Client,SK_STORAGE,SK_MF_ORDER_DATE,SK_ST_DELIVERY_DATE,SK_CLIENT_ORDER_DATE,
SK_CLIENT_DELIVERY_DATE,MF_PRICE,DAYS_BTW_CLNT_ORDER_DLVRY)
values (3,2,1,8,5,9,10, 385.4, 11);

insert into FACT_SALES_PIPELINE (SK_Car,SK_Client,SK_STORAGE,SK_MF_ORDER_DATE,SK_ST_DELIVERY_DATE,SK_CLIENT_ORDER_DATE,
SK_CLIENT_DELIVERY_DATE,MF_PRICE,DAYS_BTW_CLNT_ORDER_DLVRY)
values (2,2,1,5,9,10,6, 444.4, 9);

insert into FACT_SALES_PIPELINE (SK_Car,SK_Client,SK_STORAGE,SK_MF_ORDER_DATE,SK_ST_DELIVERY_DATE,SK_CLIENT_ORDER_DATE,
SK_CLIENT_DELIVERY_DATE,MF_PRICE,DAYS_BTW_CLNT_ORDER_DLVRY)
values (2,4,3,5,6,8,7, 387.4, 18);

