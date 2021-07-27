CREATE DATABASE BookStore
USE BookStore
/*NADEEN   ZEINNA*/
create table publisher
(
	P_id int primary key,
	pname nvarchar(50),
	country nvarchar(50),
	city nvarchar(50),
	area nvarchar(50),
	street nvarchar(50),
	building nvarchar(50),
	e_mail nvarchar(50)
);

/*NADEEN   ZEINNA*/
create table publisher_number
(
	P_id int not null foreign key references publisher(P_id) on delete cascade on update cascade,
	phone_no nvarchar(20) not null,
	primary key(P_id,phone_no)
);


/*NADA*/
create table AUTHOR (
	A_id int primary key ,
	FName nvarchar (50),
	LName nvarchar (50),
	Country nvarchar (50),
	Birth_year int
);
/*NADA*/
create table TRANSLATOR (
	T_id int primary key not null,
	FName nvarchar (50),
	LName nvarchar (50)
);

/*RADWA*/
create table CUSTOMER(
	Customer_Id int primary key ,
	FName nvarchar(100) not null,
	LName nvarchar (100) not null,
	Email nvarchar(120),
	city nvarchar(60) not null,
	Area nvarchar(60),
	Street nvarchar(60) not null,
	BuildingNum nvarchar(50)
	

);
/*RADWA*/
create table CUSTOMER_NUMBER(
	C_Id int not null,
	Phone_num nvarchar(20) not null,
	constraint pk_cn primary key (C_Id,Phone_num)

);
/*NADA  NADEEN NEVEEN RADWA*/
CREATE TABLE Book(
	B_id INT PRIMARY KEY IDENTITY(1,1),
	ISBN NVARCHAR(13) NOT NULL UNIQUE,
	Title NVARCHAR(60),
	B_Type NVARCHAR(60),
	Genre NVARCHAR(60),
	Edition INT,
	Publication_Year INT,
	O_lang NVARCHAR(50),
	T_lang NVARCHAR(60),
	Amount INT,
	C_Price SMALLMONEY,
	P_id INT FOREIGN KEY REFERENCES publisher(P_id) ON UPDATE CASCADE ON DELETE SET NULL,
	A_id INT FOREIGN KEY REFERENCES AUTHOR(A_id) ON UPDATE CASCADE ON DELETE SET NULL,
	T_id INT FOREIGN KEY REFERENCES TRANSLATOR(T_id) ON UPDATE CASCADE ON DELETE SET NULL

);

/*RADWA*/
create table BUY_BOOK(
C_Id int not null constraint fk_c_id foreign key (C_Id) references	CUSTOMER (Customer_Id) on update cascade on delete cascade,
B_Id int  not null constraint fk_book foreign key (B_Id) references Book (B_id) ,
Amount int ,
DateTime datetime not null,
constraint pk_bb primary key (B_Id,C_Id)
);

/*NEVEEN ZEINNA*/
CREATE TABLE Pub_Order (
	O_id INT PRIMARY KEY,
	P_id INT FOREIGN KEY REFERENCES publisher(P_id) ON UPDATE CASCADE ON DELETE SET NULL,
	date DATE

);

/*NEVEEN*/
CREATE TABLE Order_Book(
	O_id INT FOREIGN KEY (O_id) REFERENCES	Pub_Order(O_id),
	B_id INT FOREIGN KEY (B_id) REFERENCES Book (B_id) ,
	P_Price INT,
	Amount INT,
	PRIMARY KEY (O_id,B_id)
);
/*NADEEN   ZEINNA*/
insert into Publisher values (100, N'الكرمة',	N'مصر',	N'القاهرة',N'مصر الجديدة',	N'عبدالله ابو السعود',	'24','info@alkarmaabooks'),
								(200, N'الاداب', N'لبنان',N'بيروت',N'ساقية الجنزير',N'بيهم',	'11'	,'rana@daraladab.com'),
								(300,N'المركز الثقافي العربي', N'لبنان',N'بيروت',N'الحمراء',	N'جاندراك','113',	'markaz.casablance@gmail.com'),
								(400,N'المحروسة',N'مصر',	N'القاهرة',	N'وسط البلد',N'شريف باشا',	'66',	'almahrosa@gmail.com'),
								(500,N'دار الشروق',N'مصر',	N'القاهرة',N'مدينةنصر',	N'سيبويه',	'7'	,'info@darelshorouk'),
								(600,N'آفاق',N'مصر',N'القاهرة',N'ميدان طلعت حرب',N'محمود بيوني',	'1',	'afaqbooks@yahoo.com'),
								(700,'Darya','India',	'New Delhi',	'Delhi',	'110',	'2'	,'info@prakashbooks.com'),
								(800,'Scholastic',	'US',	'New York',	'NYC',	'Broadway'	,'557',	'digitalinfo@scholastic.com'),
								(900,'HarperCollins',	'US',	'New York',	'NYC',	'Broadway',	'195',	'orders@harpercollins.com'),
								(1100,'Vintage Books',	'US',	'New York',	'NYC',	'Broadway',	'273'	,'consumerservices@penguinrandomhouse.com'),
								(1200,'Knopf',	'US',	'New York',	'NYC',	'Broadway',	'1745',	'KnopfDoubledayRights@prh.com'),
								(1300,'Walker Books',	'England',	'London',	'London',	'Vauxhall Walk',	'SE11 5HJ',	'export@walker.co.uk'),
								(1400,'Penguin',	'England',	'London',	'London',	'Wrights Lane',	'W8 5TZ',	'customersupport@penguinrandomhouse.co.uk');


/*NADEEN ZEINNA*/
insert into Publisher_Number values (100,'225161652'),
(200,'03861632'),
(200,'01861633'),
(300,'013528260'),
(300,'01750507'),
(400,'228432157'),	
(500,'0224023399'),
(600,'0225779803'),	
(600,'01111602787'),	
(600,'0225778743'),
(700,'02324706265'),		
(800,'8003871437'),
(900,'18002427737'),
(1100,'18007333000'),
(1200,'21257226620'),
(1300,'004402077930909'),
(1400,'004401206256000');


/*NADA*/
insert into AUTHOR values
(10, N'أحمد', N'توفيق' , 'Egypt', 1962),
(20, N'راينر', N'ريلكه', 'Germany', 1883),
(21, N'ألبير', N'كامو', 'France', 1913),
(66, N'فيودور', N'دستويفسكي', 'Russia', 1821),
(70, 'Alaan', 'Moore', 'England', 1950),
(22,'George', 'Orwell', 'Britain', 1903),
(15, 'Antoine', 'De Saint', 'France', 1900),
(18, 'Haruki', 'Murakami', 'Japan', 1949),
(71, 'Suzanne', 'Collins', 'US', 1962),
(77,'Veronica', 'Roth', 'US', 1988),
(98,'Jennifer', 'Niven','US', 1968),
(87, 'Pedro', 'Mairal', 'Argentina', 1970),
(80, 'E.L', 'Konigsburg', 'US', 1930),
(91, 'R.K', 'Narayan', 'India', 1906);
/*NADA*/
insert into TRANSLATOR values
(55, N'صلاح', N'هلال'),
(65, N'ادريس', N'سهيل'),
(20, N'سامي', N'الدروبي'),
(17, N'محمد', N'سامي'),
(6, N'عباس', N'حافظ'),
(15,'Antoine', 'De Saint'),
(11, N'ايمان', N'رزق الله'),
(13,'Philip', 'Gabriel'),
(34, N'مارك', N'جمال');

/*RADWA*/
insert into CUSTOMER values (78543217,'Ahmed','Ali','ahmedali1@gmail.com',N'القاهرة',N'حي عابدين',N'شارع البستان','4'),
							
							
							(78543211,'Saly','Sleem','salyss5@gmail.com',N'القاهرة',N'التبين',N'شارع الملقة','16'),
							(78543212,'Ali','salem','alisalem12@gmail.com',N'القاهرة',N'دارالسلام',N'شارع أحمد ذكي','15'),
							
							(78543216,'Mai','Ali','maia88@gmail.com',N'القاهرة',N'العباسية',N'شارع برج التطبيقيين ','5'),
							(78543218,'Radwa','Ahmed','rahmed7@gamil.com',N'القاهرة',N'حلوان',N'شارع منصور','4'),
							(78543274,'Mouhammed','Fathy','f_mouhamed74@gmail.com',N'الجيزة',N'العبابدة',N'شارع أحمد سليمان','3'),
							
							(78543213,'Nour','Hossam','n_hossam826@gmail.com',N'القاهره',N'مدينة نصر',N'شارع مكرم عبيد','11'),
						
							(78543233,'Wlaa','Ahmed','wlaaahmed44@gmail.com',N'القاهرة',N'الزمالك',N'شارع صلاح الدين','12'),
							(78543244,'Samir','Gaber','samir_g54@gmail.com',N'القاهرة',N'الزمالك',N'شارع  حسين باشا صبري','7'),
							(78543255,'Eman','Younos','emany78@gmail.com',N'القاهره',N'الزمالك',N'شارع ابن زنكي','8'),
							(78543266,'Mohsen','Samir','m_samir41@gmail.com',N'القاهرة',N'مدينة نصر',N'شارع مصطفى النحاس','2'),
							(78543277,'Nada','Medhat','nada_m85@gmail.com',N'القاهرة',N'الزمالك',N'شارع بهاء الدين','24');
/*RADWA*/
insert into CUSTOMER_NUMBER values(78543217,'02768451'),
								  (78543212,'02785353'),
								  
								  
								  
								  (78543277,'02794391'),
								  (78543244,'02701004'),
								  (78543255,'02724500'),
								 
								  (78543233,'02755252'),
								  (78543266,'02723753'),
								  
								  (78543211,'02769191'),
								  (78543213,'02717870'),
								  (78543274,'02794094'),
								  (78543218,'02727820'),
								  (78543216,'02741201');
								  
								  
								  

/*NADEEN NEVEEN NADA RADWA*/
INSERT INTO Book VALUES ('9789776467552', N'في ممر الفئران', 'Fiction', 'Horror',1 ,2016,'Arabic',null,30,70, 100,10,null),
						('9789776467750', N'رسائل الي شاعر شاب', 'non-fiction','letters',	2,2018 ,'German','Arabic',60,40,100,20,55),
						('9789953893747',N'الطاعون','Fiction','Philosophical',8,2013,'French','Arabic',10 , 120,200,21,65),
						('9789953688893', N'المزدوج', 'Fiction','Classic',     1,2018,'Russian','Arabic',5,110,300,66,20),
						('9789953684626',	N'الجريمة والعقاب 1','Fiction',	'Classic',	7,  2010,'Russian','Arabic', 25, 100,300,66,20),
						('9789953684628',	N'الجريمة والعقاب 2', 'Fiction', 'Classic',	7,	2010, 'Russian', 'Arabic',10,100,300,66,20),
						('9789953686905',	N'مذكرات من البيت الميت', 'Fiction','Classic' ,7, 2014, 'Russian','Arabic',13,90,300,66,20),
						('9789773137885',	N'المزحة القاتلة','Fiction','Comics',1,    2020,'English','Arabic',16,120,400,70,17),
						('9789770924068',	N'animal farm','Fiction', 'Classic',22,  1945,'English',null,40	,55,500,22,null),
						('9789777650823',	N'مزرعة الحيوان','Fiction','Classic',10, 2017,'English',	'Arabic',46,43.5,600,22,6),
						('9788175993570',	N'the little prince',  'Fiction','Fairytale',23,1943,'French','English',34,80.75,700,15,15),
						('9789770933077',	N'يوتوبيا',	          'Fiction','Fantasy',9,   2018,'Arabic',null, 24, 41.35,500,10,null),
						('9789953682839',	N'كافكا على الشاطئ','Fiction','Fantasy',3,    2013,'Japanese','Arabic',11,156.7,300,18,11),
						('9780439023511','Mockingjay', 'Fiction', 'Science Fiction',	1,2010, 'English',null	,45	,175,800,71,null),
						('9780007524273', 'Allegiant', 'Fiction', 'Science Fiction',3,	2013, 'English' ,null,	27,	250, 900,77,null),
						('9784103534259', '1Q84: Book 3','Fiction','Fantasy',4,2011,'Japanese', 'English',6	,150, 1100,18,13),
						('9780385755887', 'All the Bright Places','Fiction','Young Adult',1,2015, 'English',null,81, 200,1200,98,null),
						('9789776467484',N'سالباتييرا','Fiction','Mystery',6	,2016,	'Spanish',	'Arabic', 25,50,100, 87, 34),
						('9780744583274','From the Mixed-Up Files of Mrs. Basil E. Frankweiler','Fiction','Young Adult',12,2003,'English', null,30,100, 1300,80,null),
						('9780140185508','The Vendor of Sweets','Fiction','Indian Lit',6,	1993,'English',	null,10,	175, 1400, 91, null)


/*RADWA*/

insert into BUY_BOOK values(78543217,2,1,'2020-03-10 05:30 pm'),
						   (78543217,3,2,'2020-03-10 05:30 pm'),
						   (78543217,8,1,'2020-03-10 05:30 pm'),
						   (78543218,16,1,'2020-01-01 1:20 pm'),
						   (78543218,17,2,'2020-01-01 1:20 pm'),
						   (78543218,19,1,'2020-01-01 1:20 pm'),
						   (78543212,15,1,'2020-03-11 6:00 pm'),
						   (78543216,6,5,'2020-01-28 9:00 am'),
						   (78543274,4,6,'2020-08-01 4:00 pm'),
						   (78543274,9,2,'2020-04-18 3:20 pm'),
						   (78543213,4,2,'2020-10-20 3:30 pm'),
						   (78543213,5,1,'2020-10-20 3:30 pm'),
						   (78543211,11,4,'2020-11-18 3:20 pm'),
						   (78543211,12,1,'2020-11-18 3:20 pm'),
						   (78543233,13,1,'2020-02-2 2:20 pm'),
						   (78543244,20,1,'2020-12-18 4:20 pm'),
						   (78543255,14,3,'2020-12-18 5:00 pm'),
						   (78543266,2,2,'2020-12-17 4:40 pm'),
						   (78543277,6,5,'2020-12-11 5:00 pm'),
						   (78543218,1,1,'2020-12-22 9:00 pm');
/*NEVEEN ZEINA*/				
INSERT INTO Pub_Order VALUES (1,100,'2020-01-01'),
							 (2,300,'2020-01-25'),
							 (7,200,'2020-05-03'),
							 (20,900,'2020-07-09'),
							 (30,600,'2020-07-28'),
							 (70,500,'2020-08-01'),
							 (72,400,'2020-08-08'),
							 (80,1400,'2020-08-10'),
							 (83,1100,'2020-09-25'),
							 (103,900,'2020-12-20'),
							 (105,500,'2021-01-01');
						      
/*NEVEEN*/						
INSERT INTO Order_Book VALUES (1,1,50,30),
							  (1,2,30,10),
							  (2,4,80,40),
							  (2,6,70,20),
							  (2,7,50,20),
							  (7,3,80,40),
							  (20,15,200,10),
							  (30,10,20,20),
							  (70,9,40,30),
							  (72,8,90,40),
							  (80,20,150,30),
							  (83,16,110,10),
							  (103,15,120,10),
							  (105,9,30,30),
							  (105,12,20,30);

-------------------------------------------------------------------------------------------------------------------------							

							/*NADEEN SERAG*/
--truncate table publisher_number 

 UPDATE Book 
 set P_id = 100 
 WHERE B_id = 1
 --
 UPDATE publisher_number 
 set phone_no = '013861632' 
 WHERE P_id = 200 and phone_no = '03861632' ;  
 --
 alter table Book add constraint unk default('unknown') for P_id
 --
 alter table Book add constraint ch check (C_price between 25 and 1000 )
  -- --
 insert into Publisher 
 values (1500, N'تكوين',	N'الكويت',	N'الشويخ',	N'الشويخ الصناعية الجديدة', null , '5','publishing@takweenkw.com')

 select * from Publisher

 Delete FROM Publisher 
 WHERE P_id not in (
			select b.P_id from book b )
-- --
 SELECT b.* 
 FROM Book b, Publisher p 
 where b.P_id = p.P_id and (Pname = N'المركز الثقافي العربي' or p.P_id = 300)  --retreve books for a specefic publisher
--
 SELECT B_id, Title 
 FROM Book 
 WHERE B_Type like 'n%' and B_Type like '%fiction'
 --
 SELECT B_id , ISBN , Title 
 FROM Book 
 WHERE Title like '% Mixed-Up Files %'    -- search for book by name 
 --
 SELECT * 
 FROM Book 
 WHERE Publication_Year between 1900 and 2000 
 order by Publication_Year
 --
 SELECT * 
 FROM Book b join Publisher p on b.P_id = p.P_id and Pname = 'Darya' --retreve book thats pname is darya
 --
 SELECT * 
 FROM Publisher p join book b on p.P_id = b.P_id 
 WHERE ISBN in ( 
			select ISBN FROM Book WHERE ISBN = '9789777650823')      -- select the info of this isbn " search for book"
--
 SELECT ISBN, Title,p.P_id,Pname 
 FROM Book b , Publisher p 
 WHERE b.P_id = p.P_id 
 order by b.Title , p.Pname
--
 SELECT COUNT(ISBN) 
 FROM Book   -- total num of books
 --
 SELECT B_id, MAX (C_Price)as 'Max book price' 
 FROM Book 
 WHERE C_Price = ( select MAX (C_Price) FROM Book) 
 group by B_id   --retreve book wiz max price	
--
 SELECT distinct ISBN, Title, C_Price , (C_Price + C_Price * 0.07) as 'c_price + vat' 
 FROM Book 
 order by Title

--
 SELECT p.p_id, phone_no, e_mail 
 FROM Publisher p,publisher_number pno 
 WHERE p.P_id = pno.P_id 
--
 SELECT P_id, pname, building,
	(country +' , '+ city +' , '+ area +' , '+ street) as 'publisher address' 
 FROM Publisher --as publisher_address
 --
 SELECT  p.P_id , p.Pname, count(phone_no)as phone_numbers 
 FROM Publisher p, publisher_number pn
 WHERE pn.P_id = p.P_id 
 group by pn.P_id, p.Pname, p.P_id 
 having count(phone_no) > 2   -- show the publisher which has more than 2 phoneNOs
 --

 SELECT p.P_id, p.Pname , COUNT (b.ISBN) as 'number_of_books' 
 FROM Publisher p join book b 
 on p.P_id = b.P_id 
 group by p.P_id,p.Pname  --select number of books for all publishers
 --

 SELECT p.P_id, p.Pname,pn.phone_no, COUNT (b.ISBN) as number_of_books  
 FROM Publisher p join book b 
 on p.P_id = b.P_id join publisher_number pn on pn.P_id = p.P_id 
 group by p.P_id,p.Pname ,pn.phone_no 
 having COUNT (b.ISBN) > 2 order by p.Pname   --publishers phoneNo for more than 2 books
 --


 ------------------------------------------------------------------------------------------------------


									/*ZEINNA ESSAM*/



select * from publisher
select * from publisher_number
select * from Pub_Order
--------------------------------------------------------------------------------------

select *from publisher
inner join publisher_number
on publisher.p_id=publisher_number.p_id
where country in('us');
-------------------------------------------------------------------------------------

SELECT 
  pname,
  
  CONCAT(publisher.country,' ',publisher.city,'',publisher.area,'',publisher.street,'',publisher.building) AS address,
   phone_no
  
FROM publisher inner join publisher_number
 
on publisher.p_id=publisher_number.p_id
order by pname ;
-----------------------------------------------------------------------------------------------

select  pname , e_mail 
from publisher, Pub_Order 
where publisher.p_id = Pub_Order.P_id and Date between '2020-03-01 ' and  '2020-10-20 ';

------------------------------------------------------------------------------------------------

select pname,phone_no

from publisher,publisher_number 

where country='US'  and pname like'%ch%';

--------------------------------------------------------------------------------------------




Select country,city, count(*) as numofpublisher
from publisher 
group by city,country
having count(*)>1
order by numofpublisher desc

---------------------------------------------------------------------------------


select publisher.pname,date
from publisher ,Pub_Order
where publisher.P_id=Pub_Order.p_id
and date= '2020-07-09';

--------------------------------------------------------------------------------
(SELECT o_id 
From  Pub_Order
Where date between '2020-01-01' and '2020-08-01'
EXCEPT
(SELECT o_id 
From Pub_Order
Where date between '2020-05-03' and '2020-07-28'))

------------------------------------------------------------------------------------------

select pname ,country,o_id,count(*)

from publisher
join Pub_Order
 on Pub_Order.p_id=publisher.p_id
 group by pname ,date,O_id,country


-----------------------------------------------------------------------------------------

select pname ,e_mail,phone_no,date

from publisher
join publisher_number
on publisher.p_id=publisher_number.p_id
 join Pub_Order
 on Pub_Order.p_id=publisher_number.p_id
 
 where e_mail='customersupport@penguinrandomhouse.co.uk'
 ---------------------------------------------------------------------------------------------------

 select publisher.city 
   from publisher 
   where publisher.street = 'Broadway'
   union 
   select publisher.city 
   from publisher 
   where publisher.street = 'Vauxhall Walk';

   ----------------------------------------------------------------------------------------------------
   ----------------------------------------------------------------------------------------------------







							  /*NEVEEN ABD EL-FATTAH*/
--MY TABLES
SELECT * FROM Pub_Order
SELECT * FROM Order_Book
SELECT * FROM Book


--
UPDATE BOOK 
SET C_Price=60 
WHERE B_id=1



--Number of books in the bookstore that published by the publisher with id=300
SELECT COUNT(P_id) AS 'Number of books' 
FROM Book 
WHERE P_id=300;

--The order id and the date from the order that has at least two books

SELECT P.O_id,P.Date 
FROM Pub_Order P 
WHERE  P.O_id IN (
			SELECT O.O_id 
			FROM Order_Book O
			GROUP BY O_id
			HAVING COUNT(*)>=2
);
--Select every book title and its publisher prive and its customer price
SELECT B.Title,B.C_Price,O.P_Price 
FROM Book B,Order_Book O
WHERE B.B_id=O.B_id
--All book title that the bookstore orderd in 2020 from the publisher with id=300
SELECT B.Title,P.date 
FROM Pub_Order P,BOOK B
WHERE P.P_id=300 AND P.P_id=B.P_id AND date LIKE '2020%';


-- Every publisher id that sent order in 2020 but never in 2021
(SELECT P_id 
FROM Pub_Order P
WHERE P.date LIKE '2020%')
EXCEPT 
(SELECT P_id 
FROM Pub_Order P
WHERE P.date LIKE '2021%');


--All book's title and date orderd in 2021
SELECT Book.Title,Pub_Order.date
From Pub_Order 
 join Order_Book
     on Pub_Order.O_id=Order_Book.O_id
 join Book 
     on Order_Book.B_id=Book.B_id
WHERE date like '2021%';


--Title and publisher price of Russian books
SELECT B.Title,O.P_Price 
FROM Book B
JOIN Order_Book O
ON O.B_id=B.B_id
WHERE B.O_lang='Russian'
ORDER BY B.TITLE DESC;


--All book's ISBN from the publisher with id=900 orderd  BETWEEN '2020-01-01' AND '2020-08-08'
SELECT Book.ISBN,Pub_Order.date,Pub_Order.P_id
FROM Pub_Order
 JOIN Book
ON Pub_Order.P_id=Book.P_id
WHERE Pub_Order.P_id=900 AND date BETWEEN '2020-01-01' AND '2020-08-08';

--Every book id that never been orderd in 2020
(SELECT B.B_id
FROM Book B)
EXCEPT
(SELECT B_id
FROM Order_Book O,Pub_Order P
WHERE P.date LIKE '2020%' AND P.O_id=O.O_id);


--The total amout of books in every order 
SELECT O_id , SUM (Amount) AS 'Total Amount' 
FROM Order_Book 
GROUP BY O_id;

--The total price of the order with id=2
SELECT O_id , SUM (P_Price) AS 'Total Price' 
FROM Order_Book 
WHERE O_id=2 
GROUP BY O_id;

--Every order id that has more than 40 books 
SELECT O_id , SUM (Amount) AS 'Amount' 
FROM Order_Book  
GROUP BY O_id 
having SUM(Amount)>40;


--Number of non-translated books in the store
SELECT COUNT(Title) AS 'NumberOfTranslatedBooks' 
FROM Book 
WHERE T_lang IS NULL;

-----------------------------------------------------------------------------------------------------

								
								/*RADWA MADHAT*/
update CUSTOMER
set Area = N'حلوان' , Street = N'شارع عبدالرحمن ' , BuildingNum = '4'
where Customer_Id = 78543213;

update BUY_BOOK 
set DateTime='2020-04-11 4:00 pm' , Amount = '3'
where C_Id = 78543212 ;

delete from CUSTOMER
where Customer_Id = 78543266;


select *
from CUSTOMER;


select FName, LName 
from CUSTOMER 
where Street like N'% أحمد %';


select FName, LName 
from CUSTOMER 
where Customer_Id like '___4____';

select FName, LName 
from CUSTOMER , BUY_BOOK
where Customer_Id = C_Id  and Amount between 2 and 5;

select CUSTOMER.FName, CUSTOMER.LName 
from CUSTOMER join CUSTOMER_NUMBER
on CUSTOMER.Customer_Id = CUSTOMER_NUMBER.C_Id  
where  CUSTOMER_NUMBER.Phone_num like '02701___';


select FName ,LName 
from CUSTOMER , BUY_BOOK , Book
where CUSTOMER.Customer_Id = BUY_BOOK.C_Id  and  BUY_BOOK.B_Id = Book.B_id and Genre = 'Classic';

select  Customer_Id , FName , LName
from CUSTOMER , BUY_BOOK
where Customer_Id = C_Id and DateTime between '2020-03-10 05:30 pm' and  '2020-10-20 3:30 pm';

select  Customer_Id , FName , LName
from CUSTOMER 
order by FName , LName;

select count(Customer_Id)
from CUSTOMER, BUY_BOOK , Book
where CUSTOMER.Customer_Id = BUY_BOOK.C_Id  and  BUY_BOOK.B_Id = Book.B_id
and Book.T_lang ='Arabic' ;




select CUSTOMER.FName , CUSTOMER.LName , CUSTOMER.Email, CUSTOMER_NUMBER.Phone_num
from CUSTOMER 
inner join CUSTOMER_NUMBER 
on CUSTOMER.Customer_Id = CUSTOMER_NUMBER.C_Id;


select CUSTOMER.FName , CUSTOMER.LName , BUY_BOOK.Amount
from CUSTOMER 
right join BUY_BOOK
on CUSTOMER.Customer_Id =BUY_BOOK.C_Id;


select Book.Title , Book.B_id ,BUY_BOOK.C_Id , count(*)
from Book
join BUY_BOOK
on Book.B_id = BUY_BOOK.B_Id
group by Book.Title , Book.B_id ,BUY_BOOK.C_Id
having count(*) > 3;





 select  distinct CUSTOMER.FName, CUSTOMER.LName, CUSTOMER.BuildingNum, CUSTOMER.city, 
		 CUSTOMER.Area, CUSTOMER.Street, CUSTOMER_NUMBER.Phone_num , BUY_BOOK.Amount , 
		 Book.ISBN, Book.Title , Book.C_Price
   from CUSTOMER 
    join CUSTOMER_NUMBER
    on CUSTOMER.Customer_Id = CUSTOMER_NUMBER.C_Id
   join BUY_BOOK
   on CUSTOMER.Customer_Id = BUY_BOOK.C_Id
   join Book 
   on BUY_BOOK.B_Id = Book.B_id
   where CUSTOMER.Customer_Id = CUSTOMER_NUMBER.C_Id and BUY_BOOK.B_Id = Book.B_id
   order by  CUSTOMER.FName;

   


   select CUSTOMER.Customer_Id 
   from CUSTOMER 
   where CUSTOMER.Area = N'الزمالك'
   union 
   select CUSTOMER.Customer_Id
   from CUSTOMER 
   where CUSTOMER.Area = N'مدينة نصر';
 


select CUSTOMER.FName
from CUSTOMER
where exists ( select CUSTOMER.Area
				from CUSTOMER
				where CUSTOMER.Area= N'حلوان');

select count(*)
from CUSTOMER , BUY_BOOK
where CUSTOMER.Customer_Id = BUY_BOOK.C_Id ;



select Book.Title , Book.B_id , CUSTOMER.Customer_Id , count(*)
from CUSTOMER 
join BUY_BOOK  
on CUSTOMER.Customer_Id = BUY_BOOK.C_Id 
join Book
on BUY_BOOK.B_Id = Book.B_id 
group by Book.Title , Book.B_id , CUSTOMER.Customer_Id ;




select CUSTOMER_NUMBER.Phone_num , BUY_BOOK.C_Id , BUY_BOOK.B_Id
from  CUSTOMER_NUMBER join BUY_BOOK
 on CUSTOMER_NUMBER.C_Id = BUY_BOOK.C_Id;


select BUY_BOOK.C_Id , count(*) 
from BUY_BOOK
group by BUY_BOOK.C_Id;

---------------------------------------------------------------------------------------------------------------

					/*NADA AYMAN*/

select * from book where genre in ('classic', 'fantasy', 'mystery') and edition > 3;

select * from author where A_id <> 66 and Birth_year > 1940;

select FName as forename, LName as surname from author;

select * from book order by Publication_year desc, edition;

select genre, avg(Publication_year) from book where Publication_year > 1800 group by genre order by genre;

select Fname as book_info, LName as genres from author union select title, genre from book;

select title, O_lang from book where genre
in(select genre from book group by genre having avg(Publication_year) > 1950 );

select book.title, book.Publication_year, author.FName, author.LName 
from book inner join author on book.A_id = author.A_id;

select book.title, book.Publication_year, author.FName, author.LName 
from book inner join author on book.A_id = author.A_id where author.FName = 'Haruki';

select book.title, book.Publication_year, translator.FName, translator.LName
from book right join translator on book.T_id = translator.T_id;

select book.title, book.Publication_year, translator.FName, translator.LName
from book cross join translator;
