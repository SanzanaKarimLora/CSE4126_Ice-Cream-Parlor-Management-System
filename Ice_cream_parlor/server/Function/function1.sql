CREATE OR REPLACE FUNCTION TotalItem(b1 in varchar2, b2 in varchar2)
	
return number
is

        m1 number;
        m2 number;
 	total number;

        
    

BEGIN

	select count(*) into m1 from menu1 @ site_link;
        select count(*) into m2 from menu2 @ site_link;

        total := m1+m2;
 
	
        return total;


END TotalItem;

/