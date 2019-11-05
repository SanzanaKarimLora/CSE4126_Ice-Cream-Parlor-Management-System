clear screen;

drop table menu cascade constraints;
drop table customer cascade constraints;
drop table orders cascade constraints;
drop table branch cascade constraints;
drop table booking cascade constraints;
drop table auditMenuitem cascade constraints;

CREATE TABLE menu(
    m_id int,
	m_name varchar(30),
	price number,
	m_type varchar(15), 
	PRIMARY KEY(m_id)
);

CREATE TABLE branch(
   b_id int,
   b_name varchar(15),
   b_address varchar(80),
   PRIMARY KEY(b_id)
);

CREATE TABLE customer(
    c_id int,
	c_name varchar(15),
	c_address varchar(15),
	c_phone number,
	c_type varchar(15),
	b_id int,
	PRIMARY KEY(c_id),
	FOREIGN KEY(b_id) REFERENCES branch(b_id)
);

CREATE TABLE orders(
    o_id int,
	o_date date,
	o_quantity int,
	o_type varchar(15),
	c_id int,
	m_id int,
	b_id int,
	PRIMARY KEY(o_id),
	FOREIGN KEY(c_id) REFERENCES customer(c_id),
    FOREIGN KEY(m_id) REFERENCES menu(m_id),
	FOREIGN KEY(b_id) REFERENCES branch(b_id)
);


CREATE TABLE booking(
    RID int,
	duration varchar(15),
	RDate date,
	RTime varchar(15),
	RType varchar(15),
	c_id int,
	PRIMARY KEY(RID),
	FOREIGN KEY(c_id) REFERENCES customer(c_id)	
);
CREATE TABLE auditMenuitem(
    ItemID int,
	ItemName varchar(30),
	ItemType varchar(15),
	OldPrice number,
	NewPrice number,
	Description varchar(25)
);
commit;






