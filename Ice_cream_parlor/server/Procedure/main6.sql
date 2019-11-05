SET SERVEROUTPUT ON;

declare
 x number ;
 name varchar2(100);
 pr number;
 
begin
      x:=&enter_id;
      name:='&enter_type';
      pr := &enter_price;
 
      DBMS_OUTPUT.PUT_LINE('Upadte Completed.');
       updatemenu(x,name,pr);
	  

exception
   when no_data_found then
        dbms_output.put_line('No Data Found!!!');
   when others then
        dbms_output.put_line('Error!!!');
   
end;
/