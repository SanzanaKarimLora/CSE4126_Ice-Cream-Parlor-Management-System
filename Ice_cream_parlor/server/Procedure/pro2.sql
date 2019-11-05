create or replace procedure bookingCheck(givendate  varchAR)
 is
  id booking.RID%Type;
  Rtime booking.RTime%Type;
  duration booking.duration%Type;
   id1 booking.RID%Type;
  Rtime1 booking.RTime%Type;
  duration1 booking.duration%Type;
  
  
  cursor R_cur is SELECT RID,duration,RTime From booking1 @ site_link  WHERE RDate = givendate;
  cursor R_cur1 is SELECT RID,duration,RTime From booking2 @ site_link  WHERE RDate = givendate;
  
BEGIN
	open R_cur;
	DBMS_OUTPUT.PUT_LINE('Checking for Dhanmondi');
	loop
	  fetch R_cur into id,duration,Rtime;
	  exit when R_cur%notfound;
			DBMS_OUTPUT.PUT_LINE(TO_CHAR(id)||' -'||TO_CHAR(givendate)||' -'||TO_CHAR(Rtime) ||' -'||TO_CHAR(duration));
		end loop;
	close R_cur;
	
	open R_cur1;
	DBMS_OUTPUT.PUT_LINE('Checking for Uttara');
	loop
	  fetch R_cur1 into id1,duration1,Rtime1;
	  exit when R_cur1%notfound;
			DBMS_OUTPUT.PUT_LINE(TO_CHAR(id1)||' -'||TO_CHAR(givendate)||' -'||TO_CHAR(Rtime1) ||' -'||TO_CHAR(duration1));
		end loop;
	close R_cur1;
end;
/

commit;