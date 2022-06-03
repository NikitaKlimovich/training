-- First day
use sales_cars;

insert into DIM_CAR (Vin_code, Model, Issue_year, Brend, Effective, Expired, Is_Current)
values ('AC-3872', 'BMW', 2017, 'BMWLuxury Vehicles1916-Present', '2022-05-31', '9999-12-31',1);

insert into DIM_CAR (Vin_code, Model, Issue_year, Brend, Effective, Expired, Is_Current)
values ('BX-4011', 'Honda', 2015, 'HondaMass-Market Cars1948-Present', '2022-05-31', '9999-12-31',1);

insert into DIM_CAR (Vin_code, Model, Issue_year, Brend, Effective, Expired, Is_Current)
values ('KN-5902', 'Ford', 2006, 'FordMass-Market Cars1903-Present', '2022-05-31', '9999-12-31',1);

insert into DIM_CAR (Vin_code, Model, Issue_year, Brend, Effective, Expired, Is_Current)
values ('II-0999', 'Toyota', 2012, 'ToyotaMass-Market Cars1937-Present', '2022-05-31', '9999-12-31',1);



insert into DIM_MANAGER (Emp_code, FIRSTNAME, LASTNAME, DEPT, Hire_date, Effective, Expired, Is_Current)
values ('5k002', 'Nikita', 'Klimovich', 'A00', '2006-04-23', '2022-05-31', '9999-12-31',1); 

insert into DIM_MANAGER (Emp_code, FIRSTNAME, LASTNAME, DEPT, Hire_date, Effective, Expired, Is_Current)
values ('9k001', 'Mikhail', 'Zheldak', 'A01', '2009-06-20', '2022-05-31', '9999-12-31',1);

insert into DIM_MANAGER (Emp_code, FIRSTNAME, LASTNAME, DEPT, Hire_date, Effective, Expired, Is_Current)
values ('9k002', 'Arseniy', 'Zhukov', 'A01', '2013-08-03', '2022-05-31', '9999-12-31',1);

insert into DIM_MANAGER (Emp_code, FIRSTNAME, LASTNAME, DEPT, Hire_date, Effective, Expired, Is_Current)
values ('8k002', 'Yulia', 'Parhomova', 'A03', '2012-06-27', '2022-05-31', '9999-12-31',1);



insert into DIM_DATE (Date_ID, Month, Day_of_week, Quarter, Week_of_year, isHol)
values (1, 1, 3, 1, 4, 1);

insert into DIM_DATE (Date_ID, Month, Day_of_week, Quarter, Week_of_year, isHol)
values (2, 2, 4, 1, 6, 1);

insert into DIM_DATE (Date_ID, Month, Day_of_week, Quarter, Week_of_year, isHol)
values (3, 6, 1, 2, 26, 0);

insert into DIM_DATE (Date_ID, Month, Day_of_week, Quarter, Week_of_year, isHol)
values (4, 5, 6, 2, 21, 1);





insert into DIM_CLIENT (Pass_code,FIRSTNAME,LASTNAME,BIRTHDAY,TEL,CITY,EMAIL,Effective, Expired,Is_Current)
values ('220989', 'Alina', 'Bojko', '2001-01-11', '+375292013430', 'Minsk', 'boiko@mail.ru', '2022-05-31', '9999-12-31',1);

insert into DIM_CLIENT (Pass_code,FIRSTNAME,LASTNAME,BIRTHDAY,TEL,CITY,EMAIL,Effective, Expired,Is_Current)
values ('215436', 'Yulia', 'Kochetkova', '2001-04-19', '+375334768697', 'Gomel', 'kocha@mail.ru', '2022-05-31', '9999-12-31',1);

insert into DIM_CLIENT (Pass_code,FIRSTNAME,LASTNAME,BIRTHDAY,TEL,CITY,EMAIL,Effective, Expired,Is_Current)
values ('209834', 'Timofey', 'Bulat', '2000-05-13', '+375295612940', 'Bobrujsk', 'bulat@mail.ru', '2022-05-31', '9999-12-31',1);





insert into DIM_SHOW_ROOM (SHOW_ROOM_NAME,CITY,STREET,BUILDING,PREVIOUS_TEL,CURRENT_TEL,EFFECTIVE_DATE)
values ('Room_1','Minsk','Kozlova','25',NULL,'+375298096533','2022-05-31');

insert into DIM_SHOW_ROOM (SHOW_ROOM_NAME,CITY,STREET,BUILDING,PREVIOUS_TEL,CURRENT_TEL,EFFECTIVE_DATE)
values ('Room_2','Brest','Lenina','98',NULL,'+3758970866','2022-05-31');

insert into DIM_SHOW_ROOM (SHOW_ROOM_NAME,CITY,STREET,BUILDING,PREVIOUS_TEL,CURRENT_TEL,EFFECTIVE_DATE)
values ('Room_3','Vitebsk','Oktyabrskaya','2',NULL,'+375335014995','2022-05-31');

insert into DIM_SHOW_ROOM (SHOW_ROOM_NAME,CITY,STREET,BUILDING,PREVIOUS_TEL,CURRENT_TEL,EFFECTIVE_DATE)
values ('Room_4','Grodno','Surganova','43',NULL,'+375292017630','2022-05-31');







insert into DIM_STORAGE (STORAGE_ID,CITY,STREET,BUILDING,TEL,PARKING_LOT_COUNT,AREA)
values (1, 'Minsk', 'Nemiga', '19', '+375298094520', 201, 405.6);

insert into DIM_STORAGE (STORAGE_ID,CITY,STREET,BUILDING,TEL,PARKING_LOT_COUNT,AREA)
values (2, 'Minsk', 'Sverdlova', '58', '+375259807609', 340, 630.7);

insert into DIM_STORAGE (STORAGE_ID,CITY,STREET,BUILDING,TEL,PARKING_LOT_COUNT,AREA)
values (3, 'Brest', 'Socialisticheskaya', '101', '+375296019980', 151, 360.1);






insert into FACT_SALES (SK_Car,SK_Client,SK_Manager,SK_Sales_date,SK_Show_room,Price)
values (1,2,1,3,2,200.3);

insert into FACT_SALES (SK_Car,SK_Client,SK_Manager,SK_Sales_date,SK_Show_room,Price)
values (2,2,3,2,1,301.6);

insert into FACT_SALES (SK_Car,SK_Client,SK_Manager,SK_Sales_date,SK_Show_room,Price)
values (2,3,2,1,3,186.9);

insert into FACT_SALES (SK_Car,SK_Client,SK_Manager,SK_Sales_date,SK_Show_room,Price)
values (3,1,2,2,2,258.3);





insert into FACT_STORAGE_SNAPSHOT (SK_Car,SK_STORAGE,SK_SNAPSHOT_DATE,DAYS_ON_STORAGE)
values (1,2,3,2);

insert into FACT_STORAGE_SNAPSHOT (SK_Car,SK_STORAGE,SK_SNAPSHOT_DATE,DAYS_ON_STORAGE)
values (2,3,1,4);

insert into FACT_STORAGE_SNAPSHOT (SK_Car,SK_STORAGE,SK_SNAPSHOT_DATE,DAYS_ON_STORAGE)
values (4,1,1,10);

insert into FACT_STORAGE_SNAPSHOT (SK_Car,SK_STORAGE,SK_SNAPSHOT_DATE,DAYS_ON_STORAGE)
values (2,1,2,8);





insert into FACT_SALES_PIPELINE (SK_Car,SK_Client,SK_STORAGE,SK_MF_ORDER_DATE,SK_ST_DELIVERY_DATE,SK_CLIENT_ORDER_DATE,
SK_CLIENT_DELIVERY_DATE,MF_PRICE,DAYS_BTW_CLNT_ORDER_DLVRY)
values (1,3,1,2,4,2,1, 320.4, 10);

insert into FACT_SALES_PIPELINE (SK_Car,SK_Client,SK_STORAGE,SK_MF_ORDER_DATE,SK_ST_DELIVERY_DATE,SK_CLIENT_ORDER_DATE,
SK_CLIENT_DELIVERY_DATE,MF_PRICE,DAYS_BTW_CLNT_ORDER_DLVRY)
values (2,2,2,1,1,4,1, 384.8, 5);

insert into FACT_SALES_PIPELINE (SK_Car,SK_Client,SK_STORAGE,SK_MF_ORDER_DATE,SK_ST_DELIVERY_DATE,SK_CLIENT_ORDER_DATE,
SK_CLIENT_DELIVERY_DATE,MF_PRICE,DAYS_BTW_CLNT_ORDER_DLVRY)
values (1,1,2,4,4,1,3, 420.7, 8);

insert into FACT_SALES_PIPELINE (SK_Car,SK_Client,SK_STORAGE,SK_MF_ORDER_DATE,SK_ST_DELIVERY_DATE,SK_CLIENT_ORDER_DATE,
SK_CLIENT_DELIVERY_DATE,MF_PRICE,DAYS_BTW_CLNT_ORDER_DLVRY)
values (3,2,2,3,1,4,2, 318.6, 11);
