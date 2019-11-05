SET SERVEROUTPUT ON;

create or replace procedure ordering_list(fromDate varchar,toDate varchar)
	
	is
	itemName varchar(200);
	
	cursor B_cur is ( SELECT m_name  FROM  menu1 @ site_link   MI INNER JOIN orders1 @ site_link  O ON MI.m_id = O.m_id 
	                 WHERE O.o_date between to_Date(fromDate,'YYYY-MM-DD' ) AND to_date(toDate,'YYYY-MM-DD') 
					   )union 
	               ( SELECT m_name  FROM  menu2  @ site_link  MI  INNER JOIN orders2 @ site_link  O  ON MI.m_id = O.m_id
	                 WHERE O.o_date between to_Date(fromDate,'YYYY-MM-DD') AND to_date(toDate,'YYYY-MM-DD'));
	 
begin
     
	open B_cur();
	loop
	  fetch B_cur into itemName;
	  exit when B_cur%notfound;
		DBMS_OUTPUT.PUT_LINE(itemName);
	end loop;
	close B_cur;
	
end;
/
