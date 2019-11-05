SET SERVEROUTPUT ON;

declare
 
 d varchar2(100);
 
begin
  	
      d:='&date';
      DBMS_OUTPUT.PUT_LINE('CHECK Booking ');
      
      bookingCheck(d);
  
exception
   when no_data_found then
        dbms_output.put_line('No Data Found!!!');
   when others then
        dbms_output.put_line('Error!!!');
   
end;
/