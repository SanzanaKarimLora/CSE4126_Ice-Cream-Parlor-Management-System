set serveroutput on;

create or replace procedure proof_left_side
is
	s_name menu.m_name%TYPE;
	s_price menu.price%TYPE;
	
	cursor cur is 
	
	((SELECT m_name,price From menu1 @ site_link  WHERE price >200 ) MINUS
	(SELECT m_name,price From menu2  @ site_link  WHERE price < 100));
	

begin
	open cur;
	loop
		fetch cur into s_name,s_price;
		exit when cur%notFound;
		dbms_output.put_line('Item_Name: '|| s_name || ',   Item_price: '|| s_price);
	end loop;
	close cur;
end proof_left_side;
/

create or replace procedure proof_right_side
is
	s_name menu.m_name%TYPE;
	s_price menu.price%TYPE;
	
	cursor cur is
	SELECT m_name,price From 
	((SELECT m_name,price From menu1 @ site_link ) MINUS ( SELECT m_name,price From menu2 @ site_link ))
	WHERE( price > 200 );	
	
begin
	open cur;
	loop
		fetch cur into s_name,s_price;
		exit when cur%notFound;
		dbms_output.put_line('Item_Name: '|| s_name || ',  Item_price: '|| s_price);
	end loop;
	close cur;
end proof_right_side;
/


begin
	dbms_output.put_line('[R:qR] DF [S:qS]:');
	dbms_output.put_line('-----------------');
	
	proof_left_side;
	dbms_output.put_line(
	'-------------------------------------------');
	dbms_output.put_line('[R DF S: qR ]:');
	dbms_output.put_line('------------------');
	proof_right_side;
	
end;
/