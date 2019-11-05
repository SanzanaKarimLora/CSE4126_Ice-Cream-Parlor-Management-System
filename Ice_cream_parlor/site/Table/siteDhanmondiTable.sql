clear screen;

drop table menu1 cascade constraints;
drop table customer1 cascade constraints;
drop table orders1 cascade constraints;
drop table branch1 cascade constraints;
drop table booking1 cascade constraints;

CREATE TABLE menu1(
    m_id int,
	m_name varchar(30),
	price number,
	m_type varchar(15), 
	PRIMARY KEY(m_id)
);

CREATE TABLE branch1(
   b_id int,
   b_name varchar(15),
   b_address varchar(80),
   PRIMARY KEY(b_id)
);

CREATE TABLE customer1(
    c_id int,
	c_name varchar(15),
	c_address varchar(15),
	c_phone number,
	c_type varchar(15),
	b_id int,
	PRIMARY KEY(c_id),
	FOREIGN KEY(b_id) REFERENCES branch1(b_id)
);

CREATE TABLE orders1(
    o_id int,
	o_date date,
	o_quantity int,
	o_type varchar(15),
	c_id int,
	m_id int,
	b_id int,
	PRIMARY KEY(o_id),
	FOREIGN KEY(c_id) REFERENCES customer1(c_id),
    FOREIGN KEY(m_id) REFERENCES menu1(m_id),
	FOREIGN KEY(b_id) REFERENCES branch1(b_id)
);


CREATE TABLE booking1(
    RID int,
	duration varchar(15),
	RDate date,
	RTime varchar(15),
	RType varchar(15),
	c_id int,
	PRIMARY KEY(RID),
	FOREIGN KEY(c_id) REFERENCES customer1(c_id)
);

commit;






