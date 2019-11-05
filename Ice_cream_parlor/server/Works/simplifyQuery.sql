set serveroutput on;

create or replace procedure withoutSimplify

is

	m_name menu.m_name%TYPE;

	
	cursor curSim is
	
	( SELECT m_name From menu M inner join orders O On M.m_id=O.m_id  WHERE  O.o_date='25-jan-2019'  ) ;

begin
	open curSim;
	loop
		fetch curSim into m_name;
		exit when curSim%notFound;
		dbms_output.put_line('Item_Name: '|| m_name);
	end loop;
	close curSim;
end withoutSimplify;
/

create or replace procedure withSimplify
is
	m_name menu.m_name%TYPE;
	
	
	cursor curWithSim is
	
     SELECT m_name  from   
	((SELECT m_name From menu1 @ site_link m inner join orders1 @ site_link o on  o.m_id=m.m_id  WHERE o.o_date='25-jan-2019' ) Union
	(SELECT m_name From menu2 @ site_link m inner join orders2 @ site_link o on  o.m_id=m.m_id  WHERE o.o_date='25-jan-2019' ));
	
	
begin

	open curWithSim;
	
	loop
		fetch curWithSim into m_name;
		exit when curWithSim%notFound;
		dbms_output.put_line('Iteam_Name: '|| m_name );
	end loop;
	close curWithSim;
	
end withSimplify;
/


begin
	dbms_output.put_line('BEFORE SIMPLIFY:');
	dbms_output.put_line('-----------------');
	withoutSimplify;
	dbms_output.put_line('-------------------------------------------');
	dbms_output.put_line('AFTER SIMPLIFY:');
	dbms_output.put_line('------------------');
	withSimplify;
	
end;
/