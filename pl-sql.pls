create or replace PROCEDURE learnerone 
(
  h_id as in vachar2,
  smvar as in varchar2,
  h_datetime in timestamp
  smout as out sys_refcursor
  )
as   
begin 
decalre
  h_name varchar(10);
  open smout for
select 
h1.h_id as id,
h2.h_ref as person,
h1.col || h2.head as work_role,
from
abc.table1 as h1 inner join abc.table2 as h2
    where h1.name = :h_name
order by h1.h_id desc
end;
  EXCEPTION
WHEN OTHERS THEN
  Raise
end;

