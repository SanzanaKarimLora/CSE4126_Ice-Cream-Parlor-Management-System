SET SERVEROUTPUT ON;

declare
 x number ;
 d1 varchar2(100);
 d2 varchar2(100);
 d varchar2(100);
 
begin
  
  
      DBMS_OUTPUT.PUT_LINE(' All Branch Selling :');
      all_branch_selling('03');
   
   
exception
   when no_data_found then
        dbms_output.put_line('No Data Found!!!');
   when others then
        dbms_output.put_line('Error!!!');
   
end;
/