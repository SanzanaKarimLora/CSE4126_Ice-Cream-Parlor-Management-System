SET SERVEROUTPUT ON;

declare

 
begin
  
  
      DBMS_OUTPUT.PUT_LINE('Top Booking Customer:');
      top_booking_customer('');
  
   
exception
   when no_data_found then
        dbms_output.put_line('No Data Found!!!');
   when others then
        dbms_output.put_line('Error!!!');
   
end;
/