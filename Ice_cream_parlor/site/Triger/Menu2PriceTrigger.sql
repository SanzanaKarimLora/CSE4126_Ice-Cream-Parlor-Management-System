CREATE OR REPLACE trigger updateAuditmenuItem2

before delete or update on menu2

for each row
when(old.m_id > 0)

BEGIN

insert into auditMenuitem values(:old.m_id,:old.m_name,:old.m_type,:old.price,:new.price,'Update in Uttara Site');

END
commit;
/