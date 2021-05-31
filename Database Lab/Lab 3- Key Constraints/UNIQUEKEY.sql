DROP TABLE course_contents;
CREATE TABLE course_contents(
	course_id	varchar(10) NOT NULL,
	course_name	varchar(20) UNIQUE,
	credit		integer,
	PRIMARY KEY(course_id)
);

INSERT INTO course_contents VALUES('CSE2101','Data Structure',3);
INSERT INTO course_contents VALUES('CSE2102','Discrete Math',3);
INSERT INTO course_contents VALUES('CSE2107','Discrete Math',3);
INSERT INTO course_contents VALUES('CSE2108','Algorithm',2);