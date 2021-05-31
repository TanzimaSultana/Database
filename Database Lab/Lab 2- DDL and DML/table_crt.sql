create Student(
	St_id	integer,
	St_name	varchar(50),
	Password varchar(50),
	Email varchar(50),
	Address varchar(50),
	Contact_no integer
	 
);
create Student_book_list(
	St_id	integer,
	Book_id integer,
	Book_name varchar(50),
	Accession_date date
);
create Book_list(
	Book_id integer,
	Book_name varchar(50),
	Writter_name varchar(50),
	Edition varchar(5),
	Number_of_copy integer(10),
	Category varchar(20)
);
	
create Request(
	Student_id integer,
	Book_id integer,
	Accession_date date
);

create Admin(
	User_name varchar(50),
	Password varchar(50),
	 
);
create Student_message(
	Student_id integer,
	Message varchar(500)
);
commit;