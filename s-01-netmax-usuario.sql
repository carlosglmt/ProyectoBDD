--@Autor: Carlos Gamaliel Morales Téllez
--@Autor: Mario Alberto Suárez Espinoza
--@Fecha creación: 01/08/2021
--@Descripción: Eliminación y creación del usuario.
declare
    v_count number(1,0);
begin
    select count(*) into v_count
    from dba_users
    where lower(username) ='netmax_bdd';
    
    if v_count > 0 then
        execute immediate 'drop user netmax_bdd cascade';
    else
        dbms_output.put_line('El usuario netmax_bdd no existe');
    end if;
end;
/

Prompt Creando al usuario netmax_bdd
create user netmax_bdd identified by netmax_bdd quota unlimited on users;

Prompt Asignando permisos necesarios al usuario netmax_bdd
grant create trigger, create any directory, create table, create session, 
    create procedure, create sequence, create view, create synonym, 
    create database link to netmax_bdd;

Prompt Usuario con permisos necesarios creado!
