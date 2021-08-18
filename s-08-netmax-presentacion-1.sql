--@Autor: Carlos Gamaliel Morales Téllez
--@Autor: Mario Alberto Suárez Espinoza
--@Fecha creación: 07/08/2021
--@Descripción: Script encargado de crear la BDD

clear screen
whenever sqlerror exit rollback;
Prompt Iniciando con la creacion de la BDD.

@s-01-netmax-main-usuario.sql
@s-02-netmax-ligas.sql
@s-03-netmax-main-ddl.sql
@s-04-netmax-main-sinonimos.sql
@s-05-netmax-main-vistas.sql
@s-06-netmax-main-triggers.sql
@s-07-netmax-main-soporte-blobs.sql

Prompt Listo !
exit