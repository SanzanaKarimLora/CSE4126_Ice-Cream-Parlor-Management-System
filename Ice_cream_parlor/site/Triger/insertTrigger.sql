create or replace trigger trigger_menu1
after insert on menu1
begin
	dbms_output.put_line('data inserted on menu1');
end;
/

create or replace trigger trigger_customer1
after insert on customer1
begin
	dbms_output.put_line('data inserted on customer1');
end;
/

create or replace trigger trigger_booking1
after insert on booking1
begin
	dbms_output.put_line('data inserted on booking1');
end;
/

create or replace trigger trigger_orders1
after insert on orders1
begin
	dbms_output.put_line('data inserted on orders1');
end;
/

create or replace trigger trigger_branch1
after insert on branch1
begin
	dbms_output.put_line('data inserted on branch1');
end;
/

create or replace trigger trigger_menu2
after insert on menu2
begin
	dbms_output.put_line('data inserted on menu2');
end;
/



create or replace trigger trigger_customer2
after insert on customer2
begin
	dbms_output.put_line('data inserted on customer2');
end;
/	

create or replace trigger trigger_booking2
after insert on booking2
begin
	dbms_output.put_line('data inserted on booking2');
end;
/

create or replace trigger trigger_orders2
after insert on orders2
begin
	dbms_output.put_line('data inserted on orders2');
end;
/

create or replace trigger trigger_branch2
after insert on branch2
begin
	dbms_output.put_line('data inserted on branch2');
end;
/