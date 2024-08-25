create or replace trigger learnone_trg
after insert on dcsdb.inventory
for each row
when (new.client_id = 'SIG' and new.user_id = 'INVUPDATE' and new.code ='Cond Update')
declare
V_reference_id Varchar(20);
begin

select regexp_substr(extranotes,'[^|]+,1,1) into V_reference_id from dcsdb.inventory

  insert into rpevent (client, datetime, reference, eventtype, source, environment)
  values (:new.client_id ,defaultmelbtime(systimestamp),V_reference_id,'CONDUPDATE',"SIG')

  exception
     when others then raise;
end;
