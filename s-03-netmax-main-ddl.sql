--@Autor: Carlos Gamaliel Morales Téllez
--@Fecha creación: 04/08/2021
--@Descripción: Creación de fragmentos en los 4 nodos
clear screen
whenever sqlerror exit rollback;
prompt =====================================
prompt Creando fragmentos para cmtbd_s1
prompt =====================================
connect netmax_bdd/netmax_bdd@cmtbd_s1
@s-03-netmax-cmt-s1-ddl.sql
prompt =====================================
prompt Creando fragmentos para cmtbd_s2
prompt =====================================
connect netmax_bdd/netmax_bdd@cmtbd_s2
@s-03-netmax-cmt-s2-ddl.sql
prompt =====================================
prompt Creando fragmentos para msebd_s1
prompt =====================================
connect netmax_bdd/netmax_bdd@msebd_s1
@s-03-netmax-mse-s1-ddl.sql
prompt =====================================
prompt Creando fragmentos para msebd_s2
prompt =====================================
connect netmax_bdd/netmax_bdd@msebd_s2
@s-03-netmax-mse-s2-ddl.sql
Prompt Listo!


