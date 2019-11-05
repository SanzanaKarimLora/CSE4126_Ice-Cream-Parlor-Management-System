set serveroutput on;


create or replace procedure addMenu(id in number,name in varchar2, prices in number, type in varchar2)
	
is
	
	

theMenuID number:= 0;
	
MID number;
	
cursor menu_cur is
	
select m_id from menu @ site_link2;
	
	
cursor menu_check is
	
select m_id from menu @ site_link2 where m_name = name;
	


BEGIN

	
open menu_check;

	loop

	fetch menu_check into theMenuID;
	
        exit when menu_check%notfound;
	
        end loop;

	close menu_check;



	open menu_cur;

	loop

	fetch menu_cur into MID;

	exit when menu_cur%notfound;

	end loop;

	close menu_cur;

	
if theMenuID <= 0

	then
	MID := MID + 1;
	
        insert into menu @ site_link2 values(MID,name,150,'milk shake');
	
        DBMS_OUTPUT.PUT_LINE('New Menu added, ID is : '|| MID );
	
        else
	
        DBMS_OUTPUT.PUT_LINE('Item already exists, ID is : '|| MID );
	

end if;

END;

/