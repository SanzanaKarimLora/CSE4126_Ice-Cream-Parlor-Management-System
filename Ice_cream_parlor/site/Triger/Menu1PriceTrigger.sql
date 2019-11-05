CREATE OR REPLACE trigger updateAuditmenuItem1

before delete or update on menu1 

for each row

when(old.m_id > 0)

BEGIN

insert into auditMenuitem values(:old.m_id,:old.m_name,:old.m_type,:old.price,:new.price,'Update in Dhanmondi Site');

END
commit;
/