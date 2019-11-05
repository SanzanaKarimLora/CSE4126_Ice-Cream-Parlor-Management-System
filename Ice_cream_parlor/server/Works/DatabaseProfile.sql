SET SERVEROUTPUT ON;

DECLARE
	card NUMBER(3);
	type namesarray IS VARRAY(6) OF VARCHAR2(10);
	colName namesarray;
	total integer;
	colSize integer;
	disVal integer;
	totalSize integer := 0;

BEGIN

	SELECT count(*) into card FROM customer;
	
	dbms_output.put_line('---------------------------');
	DBMS_OUTPUT.PUT_LINE('Cardinality of customer : ' || card);
	dbms_output.put_line('----------------------------------');
	
	colName := namesarray('c_id','c_name','c_address','c_phone','c_type','b_id');
	total := colName.count;
	dbms_output.put_line('---DISTINCT NO OF ROWS IN EVERY ATTRIBUTE---');

	
	
	  SELECT count(DISTINCT (c_id)) into disVal FROM customer;
      dbms_output.put_line('Column[' || colName(1)|| ']' || ' = ' || disVal); 
	   SELECT count(DISTINCT (c_name)) into disVal FROM customer;
      dbms_output.put_line('Column[' || colName(2)|| ']' || ' = ' || disVal); 
	  
	   SELECT count(DISTINCT (c_address)) into disVal FROM customer;
      dbms_output.put_line('Column[' || colName(3)|| ']' || ' = ' || disVal); 
	  
	   SELECT count(DISTINCT (c_phone)) into disVal FROM customer;
      dbms_output.put_line('Column[' || colName(4)|| ']' || ' = ' || disVal); 
	  
	    SELECT count(DISTINCT (c_type)) into disVal FROM customer;
      dbms_output.put_line('Column[' || colName(5)|| ']' || ' = ' || disVal); 	  
	  
	  
	
	dbms_output.put_line('----------------------');
	dbms_output.put_line('---MAX SIZE OF ROW FOR EVERY ATTRIBUTE---');
	
	
	   SELECT max(length (c_id)) into colSize FROM customer;
      dbms_output.put_line('Column[' || colName(1)|| ']' || ' = ' || colSize); 
	   totalSize := totalSize + colSize;
	   SELECT max(length(c_name)) into colSize FROM customer;
      dbms_output.put_line('Column[' || colName(2)|| ']' || ' = ' || colSize); 
	   totalSize := totalSize + colSize;
	  
	   SELECT max(length (c_address)) into colSize FROM customer;
      dbms_output.put_line('Column[' || colName(3)|| ']' || ' = ' || colSize); 
	   totalSize := totalSize + colSize;
	  
	   SELECT max(length(c_phone)) into colSize FROM customer;
      dbms_output.put_line('Column[' || colName(4)|| ']' || ' = ' || colSize); 
	   totalSize := totalSize + colSize;
	  
	    SELECT max(length (c_type)) into colSize FROM customer;
      dbms_output.put_line('Column[' || colName(5)|| ']' || ' = ' || colSize); 
	   
	  totalSize := totalSize + colSize; 
    
 
	
	dbms_output.put_line('----------------------------------------------'); 
	dbms_output.put_line('SUM OF SIZE OF ALL ATTRIBUTES : ' || totalSize); 
	dbms_output.put_line('----------------------------------------------');
 
END;
/

