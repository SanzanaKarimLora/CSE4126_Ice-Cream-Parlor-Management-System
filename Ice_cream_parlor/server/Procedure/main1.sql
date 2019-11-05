SET SERVEROUTPUT ON;

declare
 
 d1 varchar2(100);
 d2 varchar2(100);
 
 
begin
  
 
     DBMS_OUTPUT.PUT_LINE('Ordering Lists:');
     d1:='&from';
     d2:='&to';
     ordering_list(d1,d2);
  
exception
   when no_data_found then
        dbms_output.put_line('No Data Found!!!');
   when others then
        dbms_output.put_line('Error!!!');
   
end;
/