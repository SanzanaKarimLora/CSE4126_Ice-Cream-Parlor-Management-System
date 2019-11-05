clear screen;

drop table menu2 cascade constraints;
drop table customer2 cascade constraints;
drop table orders2 cascade constraints;
drop table branch2 cascade constraints;
drop table booking2 cascade constraints;

CREATE TABLE menu2(
    m_id int,
	m_name varchar(30),
	price number,
	m_type varchar(15), 
	PRIMARY KEY(m_id)
);

CREATE TABLE branch2(
   b_id int,
   b_name varchar(15),
   b_address varchar(80),
   PRIMARY KEY(b_id)
);

CREATE TABLE customer2(
    c_id int,
	c_name varchar(15),
	c_address varchar(15),
	c_phone number,
	c_type varchar(15),
	b_id int,
	PRIMARY KEY(c_id),
	FOREIGN KEY(b_id) REFERENCES branch2(b_id)
);

CREATE TABLE orders2(
    o_id int,
	o_date date,
	o_quantity int,
	o_type varchar(15),
	c_id int,
	m_id int,
	b_id int,
	PRIMARY KEY(o_id),
	FOREIGN KEY(c_id) REFERENCES customer2(c_id),
    FOREIGN KEY(m_id) REFERENCES menu2(m_id),
	FOREIGN KEY(b_id) REFERENCES branch2(b_id)
);


CREATE TABLE booking2(
    RID int,
	duration varchar(15),
	RDate date,
	RTime varchar(15),
	RType varchar(15),
	c_id int,
	PRIMARY KEY(RID),
	FOREIGN KEY(c_id) REFERENCES customer2(c_id)
);

commit;






