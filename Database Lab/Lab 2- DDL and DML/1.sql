drop table stock;
drop table specs;
drop table cars;

create table cars(
	md_num	integer,
	md_name	varchar(10),
	style	varchar(10),
	year	integer
);

create table specs(
	md_num	integer,
	mpg	integer,
	radio	varchar(10),
	engine	varchar(10)
);

create table stock(
	md_num	integer,
	qty	integer,
	price	integer
);

insert into cars (md_num, md_name, style, year) values (1, 'Honda', 'Coupe', 1983);

insert into cars (md_num, md_name, style, year) values (2, 'Toyota', 'Saloon', 1990);

insert into cars (md_num, md_name, style, year) values (3, 'Buick', 'Estate', 1991);

insert into cars (md_num, md_name, style, year) values (4, 'Nissan', 'Van', 1992);

insert into cars (md_num, md_name, style, year) values (5, 'Ford', 'Saloon', 1993);

insert into specs (md_num, mpg, radio, engine) values (1, 43, 'Yes', '2L-4CYL');

insert into specs (md_num, mpg, radio, engine) values (2, 25, 'No', '4L-V8');

insert into specs (md_num, mpg, radio, engine) values (3, 18, 'Yes', '5L-V8');

insert into specs (md_num, mpg, radio, engine) values (4, 50, 'No', '2L-4CYL');

insert into specs (md_num, mpg, radio, engine) values (5, 45, 'Yes', '3L-V6');

insert into stock (md_num, qty, price) values (1, 10, 4980);
insert into stock (md_num, qty, price) values (2, 3, 13865);
insert into stock (md_num, qty, price) values (3, 5, 14900);
insert into stock (md_num, qty, price) values (4, 1, 11000);
insert into stock (md_num, qty, price) values (5, 2, 24600);

commit;