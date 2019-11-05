set serveroutput on;



DECLARE
	
        
        sum number;
BEGIN
	

sum := TotalItem('Dhanmondi','Uttara');
	

dbms_output.put_line('Total item of 2 branches : ' || sum);


	
END;

/