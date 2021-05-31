drop table food;
drop table home_delivery;
drop table ordered_food;
drop table online_payment;

create table food(
	food_code number(3) not null,
	food_type varchar(10),
	food_name varchar(30) unique,
	price integer check(price>0),
	primary key(food_code)
);
create table home_delivery(
	customer_id varchar(5) not null,
	name varchar(20),
	address varchar(30),
	contact_no number(15),
	order_date date,
	delivery_date date,
    payment_type number(20),
    paid_amount integer check(paid_amount>0),
    primary key(customer_id)
);
create table ordered_food(
	o_customer_id varchar(5),
    o_food_code number(3),
    no_of_food integer,
    day date,
    foreign key(o_customer_id) references home_delivery,
    foreign key(o_food_code) references food
);
create table online_payment(
	p_customer_id varchar(5),
    card_type varchar(20),
    foreign key(p_customer_id) references home_delivery
);

describe food;
describe home_delivery;
describe ordered_food;
describe online_payment;

alter table online_payment add card_no number(20);
alter table home_delivery modify payment_type varchar(15);
alter table ordered_food drop column day;
alter table food rename column price to price_per_item;

describe food;
describe home_delivery;
describe ordered_food;
describe online_payment;

insert into food values(101,'rice','Egg fried rice',120);
insert into food values(102,'rice','Chicken fried rice',170);
insert into food values(103,'rice','Special fried rice',200);
insert into food values(104,'rice','Beef fried rice',220);
insert into food values(201,'vegetable','Plain chineese vegetable',120);
insert into food values(202,'vegetable','Mixed vegetable',180);
insert into food values(301,'chicken','Chicken fry',240);
insert into food values(302,'chicken','Chicken chilies with onions',250);
insert into food values(303,'chicken','Chicken dopayaza',250);
insert into food values(801,'soup','Thai special soup',200);
insert into food values(802,'soup','Corn soup',150);
insert into food values(901,'fast food','Pizza(chicken,beef,mutton)',300);
insert into food values(902,'fast food','Burger(chicken,beef,cheese)',200);
insert into food values(903,'fast food','Shwarma(chicken,beef)',150);
insert into food values(904,'fast food','French fry',100);

insert into home_delivery values('c0001','Rahim','Khalishpur,Khulna',01712977981,'21-Sep-14','22-Sep-14','Cash',400);
insert into home_delivery values('c0002','Karim','Doulatpur,Khulna,9000',01712977981,'21-Sep-14','21-Sep-14','Cash',590);
insert into home_delivery values('c0003','Kamal','Fulbarigate,Khulna',01712977981,'21-Sep-14','23-Sep-14','Online',1000);
insert into home_delivery values('c0004','Jamal','Dakbangla,Khulna',01712977981,'21-Sep-14','22-Sep-14','Online',1300);	
insert into home_delivery values('c0005','Zaman','Raligate,Khulna',01712977981,'21-Sep-14','21-Sep-14','Online',500);		

insert into ordered_food values('c0001',902,2);
insert into ordered_food values('c0002',102,1);
insert into ordered_food values('c0002',202,1);
insert into ordered_food values('c0002',301,1);
insert into ordered_food values('c0003',103,2);
insert into ordered_food values('c0003',302,2);
insert into ordered_food values('c0003',904,1);
insert into ordered_food values('c0004',801,2);
insert into ordered_food values('c0004',901,1);
insert into ordered_food values('c0004',902,2);
insert into ordered_food values('c0004',904,2);
insert into ordered_food values('c0005',802,2);
insert into ordered_food values('c0005',904,2);

insert into online_payment values('c0003','Credit',10102034560);
insert into online_payment values('c0004','Debit',11000325601);
insert into online_payment values('c0005','Credit',10020145601);

commit;

select * from food;
select * from home_delivery;
select * from ordered_food;
select * from online_payment;

update food set food_name='Special Thai soup' where food_code=801;
update home_delivery set price=600 where name='Rahim';
update ordered_food set no_of_food=3 where o_customer_id='c0001';
update online_payment set card_type='Master' where p_customer_id='c0004';

delete from food where food_name='Beef fried rice';

select * from food;
select * from home_delivery;
select * from ordered_food;
select * from online_payment;

select food_code,food_name,price_per_item from food;
select food_code,food_name,price_per_item from food where food_type='fast food';

select food_code,food_type,food_name,price_per_item from food where price_per_item>200;
select food_code,food_type,food_name,price_per_item from food where price_per_item=200 or price_per_item=250;
select food_code,food_type,food_name,price_per_item from food where food_type='chicken' and price_per_item>240;

select food_code,food_type,food_name,price_per_item from food where food_code between 101 and 301;
select food_code,food_type,food_name,price_per_item from food where food_code not between 101 and 301;

select food_code,food_type,food_name,price_per_item from food where food_code in(101,303);
select food_code,food_type,food_name,price_per_item from food where food_code not in(101,303);

select food_code,food_type,food_name,price_per_item from food order by price_per_item;
select food_code,food_type,food_name,price_per_item from food order by price_per_item desc;
select distinct (food_type) from food;

select max(price_per_item) from food;
select count(*) from home_delivery;
select sum(paid_amount) from home_delivery;
select avg(paid_amount) from home_delivery;

select ord.o_customer_id,(f.price_per_item*ord.no_of_food) as total_price from food f,ordered_food ord where f.food_code=ord.o_food_code order by ord.o_customer_id;

select food_type,count(*) as no_of_food_type from food group by food_type;
select food_type,count(*) as no_of_food_type from food group by food_type having count(*)>2;
select o_customer_id,sum(no_of_food) from ordered_food group by o_customer_id;

SUBQUERY:
select h.name,h.paid_amount from home_delivery h where h.customer_id in(select op.p_customer_id from online_payment op);
select f.food_name from food f where f.food_code in(select ord.o_food_code from ordered_food ord where ord.o_customer_id in(select h.customer_id from home_delivery h where h.name='Kamal'));

UNION:
select f.food_name,f.price_per_item,ord.no_of_food from food f,ordered_food ord where f.price_per_item>=200 and f.food_code=ord.o_food_code union 
select f.food_name,f.price_per_item,ord.no_of_food from food f,ordered_food ord where ord.no_of_food=2;

select h.name,h.paid_amount from home_delivery h where h.paid_amount>500 union
select h.name,h.paid_amount from home_delivery h where h.customer_id in(select op.p_customer_id from online_payment op where op.p_customer_id=h.customer_id);

INTERSECTION:
select f.food_name,f.price_per_item,ord.no_of_food from food f,ordered_food ord where f.price_per_item>=200 and f.food_code=ord.o_food_code intersect 
select f.food_name,f.price_per_item,ord.no_of_food from food f,ordered_food ord where ord.no_of_food=2;

select h.name,h.paid_amount from home_delivery h where h.paid_amount>500 intersect
select h.name,h.paid_amount from home_delivery h where h.customer_id in(select op.p_customer_id from online_payment op where op.p_customer_id=h.customer_id);

MINUS:
select h.name,h.paid_amount from home_delivery h where h.paid_amount>500 minus
select h.name,h.paid_amount from home_delivery h where h.customer_id in(select op.p_customer_id from online_payment op where op.p_customer_id=h.customer_id);

NATURAL JOIN:
select f.food_type,f.food_name,ord.o_customer_id,ord.no_of_food from food f natural join ordered_food ord where f.food_code=ord.o_food_code;

JOIN:
select f.food_type,f.food_name,ord.o_customer_id,ord.no_of_food from food f join ordered_food ord on f.food_code=ord.o_food_code and f.price_per_item>200;


PL\SQL:
set serveroutput on
declare 
    max_cname home_delivery.name%type;
    max_paid home_delivery.paid_amount%type;
begin
    select max(paid_amount) into max_paid from home_delivery;
    select name into max_cname from home_delivery where paid_amount=max_paid;
    dbms_output.put_line('Max paid customer name ' || max_cname || ' and paid amount ' || max_paid);
end;
/
show errors;

create or replace function max_customer_name return varchar is 
    c_name home_delivery.name%type;
    max_paid home_delivery.paid_amount%type;
begin
    select max(paid_amount) into max_paid from home_delivery;
    select name into c_name from home_delivery where paid_amount=max_paid;
    return c_name;
end;
/
show errors;
set serveroutput on 
begin
     dbms_output.put_line('Max paid customer name ' || max_customer_name);
end;
/


PL/SQL FUNCTION:
create or replace function total_pay(pay_type in home_delivery.payment_type%type) 
	return number is 
	total home_delivery.paid_amount%type;
begin
    select sum(paid_amount) into total from home_delivery where payment_type=pay_type;
    return total;
end;
/
set serveroutput on 
begin
    dbms_output.put_line('Total pay' || total_pay('Online'));
end;
/
show errors;

CURSOR:
set serveroutput on
declare 
    cursor fcur is 
    select food_name,price_per_item from food;
    frecord fcur%rowtype;
begin
    open fcur;
    loop
        fetch fcur into frecord;
        exit when fcur%rowcount>5;
        dbms_output.put_line('Food name-' || frecord.food_name || ' Price-' || frecord.price_per_item);
    end loop;
    close fcur;
end;
/
show errors;

PROCEDURE:
create or replace procedure  customerInfo is
	cname home_delivery.name%type;
	caddress home_delivery.address%type;
begin 
    cname := 'Zaman';
    select address into caddress from home_delivery where name=cname;
    dbms_output.put_line('Name-' || cname || ' Address-' || caddress);
end;
/
set serveroutput on 
begin
    customerInfo;
end;
/
show errors;

TRIGGER:
create or replace trigger check_price_per_item before insert or update on food for each row
declare
    pmax number := 500;
    pmin number := 100;
begin
    if :new.price_per_item>pmax or :new.price_per_item<pmin then
    RAISE_APPLICATION_ERROR(-20000,'New price is too small or large');
    end if;
end;
/
show errors;
insert into food values(905,'fast food','Sandwitch',50);

