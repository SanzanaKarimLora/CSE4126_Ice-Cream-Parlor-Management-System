set serveroutput on;

create or replace procedure beforesemi
is
	m_name menu.m_name%TYPE;
	m_type menu.m_type%TYPE;
	o_t orders.o_type%TYPE;
	
	cursor cur1 is 	
	SELECT m_name,m_type,O_type FROM  menu   MI INNER JOIN orders  O ON MI.m_id = O.m_id  WHERE O.o_date ='25-jan-2019';      					   

begin

	open cur1;
	loop
		fetch cur1 into m_name,m_type,o_t;
		exit when cur1%notFound;
		dbms_output.put_line('Item_Name: '|| m_name || ',  Item_Type: '|| m_type|| ', Orders_type '|| o_t);
		
	end loop;
	close cur1;
end beforesemi;
/

create or replace procedure aftersemi
is
	
    m_name menu.m_name%TYPE;
	m_type menu.m_type%TYPE;
	o_t orders.o_type%TYPE;

	
	cursor cur2 is 
	
	WITH sem as
	(SELECT * FROM menu WHERE EXISTS ( SELECT * FROM ( SELECT m_id FROM
	orders) odr WHERE menu.m_id = odr.m_id))
	SELECT sem.m_name,sem.m_type,o_type FROM sem INNER JOIN
	orders ON sem.m_id = orders.m_id WHERE orders.o_date = '25-jan-2019';	
	
begin
	open cur2;	
	loop
		fetch cur2 into m_name,m_type,o_t;
		exit when cur2%notFound;
		dbms_output.put_line('Item_Name: '|| m_name || ',  Item_Type: '|| m_type|| ', Orders_type '|| o_t);
		
	end loop;
	close cur2;	
end aftersemi;
/

begin
	dbms_output.put_line('BEFORE SEMIJOIN:');
	dbms_output.put_line('-----------------');
	beforesemi;
	dbms_output.put_line('-------------------------------------------');
	dbms_output.put_line('AFTER SEMIJOIN:');
	dbms_output.put_line('------------------');
	aftersemi;
	
end;
/