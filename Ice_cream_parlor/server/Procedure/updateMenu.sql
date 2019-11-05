create or replace procedure updatemenu(id number,ty varchar,p number)
	is
	
begin
 
 
  if(ty='ice cream')
  then
   Update menu1 @ site_link set price = p where m_id = id;
   
  else  
     Update menu2 @ site_link set price = p where m_id = id;
  	  
  end if;
	  
	
end;
/
commit;