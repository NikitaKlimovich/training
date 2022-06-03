-- Second day
use sales_cars;
select * from DIM_CAR;
update DIM_CAR set Expired = '2022-05-31', Is_Current=0 where Vin_code = 'AC-3872';

insert into DIM_CAR (Vin_code, Model, Issue_year, Brend, Effective, Expired, Is_Current)
values ('AC-3872', 'BMW', 2016, 'BMWLuxury Vehicles1916-Present', '2022-06-01', '9999-12-31',1);

update DIM_CAR set Expired = '2022-05-31', Is_Current=0 where Vin_code = 'BX-4011';

insert into DIM_CAR (Vin_code, Model, Issue_year, Brend, Effective, Expired, Is_Current)
values ('BX-4011', 'Volvo', 2015, 'HondaMass-Market Cars1948-Present', '2022-06-01', '9999-12-31',1);

update DIM_CAR set Expired = '2022-05-31', Is_Current=0 where Vin_code = 'II-0999';

insert into DIM_CAR (Vin_code, Model, Issue_year, Brend, Effective, Expired, Is_Current)
values ('II-0999', 'Toyota', 2012, 'ToyotaMass-Market', '2022-06-01', '9999-12-31',1);





update DIM_MANAGER set Expired = '2022-05-31', Is_Current=0 where Emp_code = '9k001';

insert into DIM_MANAGER (Emp_code, FIRSTNAME, LASTNAME, DEPT, Hire_date, Effective, Expired, Is_Current)
values ('9k001', 'Artem', 'Zheldak', 'A01', '2009-06-20', '2022-06-01', '9999-12-31',1);

update DIM_MANAGER set Expired = '2022-05-31', Is_Current=0 where Emp_code = '9k002';

insert into DIM_MANAGER (Emp_code, FIRSTNAME, LASTNAME, DEPT, Hire_date, Effective, Expired, Is_Current)
values ('9k002', 'Arseniy', 'Zhukov', 'A00', '2013-08-03', '2022-06-01', '9999-12-31',1);

update DIM_MANAGER set Expired = '2022-05-31', Is_Current=0 where Emp_code = '8k002';

insert into DIM_MANAGER (Emp_code, FIRSTNAME, LASTNAME, DEPT, Hire_date, Effective, Expired, Is_Current)
values ('8k002', 'Yulia', 'Parhomova', 'A02', '2012-06-27', '2022-06-01', '9999-12-31',1);



insert into DIM_DATE (Date_ID, Month, Day_of_week, Quarter, Week_of_year, isHol)
values (5, 3, 5, 1, 11, 0);

insert into DIM_DATE (Date_ID, Month, Day_of_week, Quarter, Week_of_year, isHol)
values (6, 11, 3, 4, 47, 1);

insert into DIM_DATE (Date_ID, Month, Day_of_week, Quarter, Week_of_year, isHol)
values (7, 9, 5, 4, 38, 1);





insert into DIM_CLIENT (Pass_code,FIRSTNAME,LASTNAME,BIRTHDAY,TEL,CITY,EMAIL,Effective, Expired,Is_Current)
values ('207182', 'Yulianna', 'Kosobutskaya', '2001-07-01', '+375293097820', 'Minsk', 'kosulya@mail.ru', '2022-06-01', '9999-12-31',1);

update DIM_CLIENT set Expired = '2022-05-31', Is_Current=0 where Pass_code = '220989';

insert into DIM_CLIENT (Pass_code,FIRSTNAME,LASTNAME,BIRTHDAY,TEL,CITY,EMAIL,Effective, Expired,Is_Current)
values ('220989', 'Alina', 'Bojko', '2001-01-11', '+375292013431', 'Minsk', 'boiko@mail.ru', '2022-06-01', '9999-12-31',1);

update DIM_CLIENT set Expired = '2022-05-31', Is_Current=0 where Pass_code = '209834';

insert into DIM_CLIENT (Pass_code,FIRSTNAME,LASTNAME,BIRTHDAY,TEL,CITY,EMAIL,Effective, Expired,Is_Current)
values ('209834', 'Timofey', 'Bulatov', '2000-05-13', '+375295612940', 'Bobrujsk', 'bulat@mail.ru', '2022-06-01', '9999-12-31',1);




update DIM_SHOW_ROOM set PREVIOUS_TEL = '+375298096533', CURRENT_TEL = '+375336012087', EFFECTIVE_DATE = '2022-06-01' where SHOW_ROOM_NAME = 'Room_1';

update DIM_SHOW_ROOM set PREVIOUS_TEL = '+3758970866', CURRENT_TEL = '+375290019022', EFFECTIVE_DATE = '2022-06-01' where SHOW_ROOM_NAME = 'Room_2';

update DIM_SHOW_ROOM set PREVIOUS_TEL = '+375292017630', CURRENT_TEL = '+375292014455', EFFECTIVE_DATE = '2022-06-01' where SHOW_ROOM_NAME = 'Room_4';





update DIM_STORAGE set PARKING_LOT_COUNT=180 where STORAGE_ID = 1;

update DIM_STORAGE set PARKING_LOT_COUNT=360 where STORAGE_ID = 3;

update DIM_STORAGE set PARKING_LOT_COUNT=127 where STORAGE_ID = 4;






insert into FACT_SALES (SK_Car,SK_Client,SK_Manager,SK_Sales_date,SK_Show_room,Price)
values (2,3,3,5,3,215.7);

insert into FACT_SALES (SK_Car,SK_Client,SK_Manager,SK_Sales_date,SK_Show_room,Price)
values (4,1,1,6,2,318.5);

insert into FACT_SALES (SK_Car,SK_Client,SK_Manager,SK_Sales_date,SK_Show_room,Price)
values (1,3,2,7,3,201.4);







insert into FACT_STORAGE_SNAPSHOT (SK_Car,SK_STORAGE,SK_SNAPSHOT_DATE,DAYS_ON_STORAGE)
values (4,1,5,12);

insert into FACT_STORAGE_SNAPSHOT (SK_Car,SK_STORAGE,SK_SNAPSHOT_DATE,DAYS_ON_STORAGE)
values (2,3,7,10);

insert into FACT_STORAGE_SNAPSHOT (SK_Car,SK_STORAGE,SK_SNAPSHOT_DATE,DAYS_ON_STORAGE)
values (3,2,7,8);






insert into FACT_SALES_PIPELINE (SK_Car,SK_Client,SK_STORAGE,SK_MF_ORDER_DATE,SK_ST_DELIVERY_DATE,SK_CLIENT_ORDER_DATE,
SK_CLIENT_DELIVERY_DATE,MF_PRICE,DAYS_BTW_CLNT_ORDER_DLVRY)
values (1,3,2,4,5,7,1, 341.3, 12);

insert into FACT_SALES_PIPELINE (SK_Car,SK_Client,SK_STORAGE,SK_MF_ORDER_DATE,SK_ST_DELIVERY_DATE,SK_CLIENT_ORDER_DATE,
SK_CLIENT_DELIVERY_DATE,MF_PRICE,DAYS_BTW_CLNT_ORDER_DLVRY)
values (3,4,3,1,2,7,6, 405.2, 7);

insert into FACT_SALES_PIPELINE (SK_Car,SK_Client,SK_STORAGE,SK_MF_ORDER_DATE,SK_ST_DELIVERY_DATE,SK_CLIENT_ORDER_DATE,
SK_CLIENT_DELIVERY_DATE,MF_PRICE,DAYS_BTW_CLNT_ORDER_DLVRY)
values (1,4,1,5,4,7,3, 356.7, 11);

