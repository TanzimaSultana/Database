DROP TABLE course_contents;
CREATE TABLE course_contents(
	course_id	varchar(10) NOT NULL,
	course_name	varchar(20) UNIQUE,
	credit		integer CHECK(credit>0 AND credit<5),
	passmark	integer DEFAULT 40,
	PRIMARY KEY(course_id)
);

INSERT INTO course_contents(course_id,course_name,credit) VALUES('CSE2101','Data Structure',3);
INSERT INTO course_contents(course_id,course_name,credit) VALUES('CSE2102','Discrete Math',3);
INSERT INTO course_contents(course_id,course_name,credit) VALUES('CSE2107','Database Systems',3);
INSERT INTO course_contents(course_id,course_name,credit) VALUES('CSE2108','Algorithm',4);