SET SERVEROUTPUT ON;

declare
 x number ;
 y number;
 
begin
  
      
      DBMS_OUTPUT.PUT_LINE('Search Menu');
      x := &price1;
      y := &price2;
      searchMenu(x,y);
 
   
exception
   when no_data_found then
        dbms_output.put_line('No Data Found!!!');
   when others then
        dbms_output.put_line('Error!!!');
   
end;
/