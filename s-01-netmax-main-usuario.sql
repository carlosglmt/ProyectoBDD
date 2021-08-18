--@Autor: Carlos Gamaliel Morales Téllez
--@Autor: Mario Alberto Suárez Espinoza
--@Fecha creación: 01/08/2021
--@Descripción: Creación de usuarios en los 4 nodos
clear screen
whenever sqlerror exit rollback;
set serveroutput on
Prompt Inciando creacion/eliminacion de usuarios.
accept syspass char prompt 'Proporcione el password de sys: ' hide
prompt =====================================
prompt Creando usuario en cmtbd_s1
prompt =====================================
connect sys/&&syspass@cmtbd_s1 as sysdba
@s-01-netmax-usuario.sql

prompt =====================================
prompt Creando usuario en cmtbd_s2
prompt =====================================
connect sys/&&syspass@cmtbd_s2 as sysdba
@s-01-netmax-usuario.sql

prompt =====================================
prompt Creando usuario en msebd_s1
prompt =====================================
connect sys/&&syspass@msebd_s1 as sysdba
@s-01-netmax-usuario.sql

prompt =====================================
prompt Creando usuario en msebd_s2
prompt =====================================
connect sys/&&syspass@msebd_s2 as sysdba
@s-01-netmax-usuario.sql

Prompt Listo!
