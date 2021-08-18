--@Autor: Carlos Gamaliel Morales Téllez
--@Autor: Mario Alberto Suárez Espinoza
--@Fecha creación: 04/08/2021
--@Descripción: Creación de sinónimos - main

clear screen
whenever sqlerror exit rollback;
prompt =====================================
prompt Creando sinonimos para cmtbd_s1
prompt =====================================
connect netmax_bdd/netmax_bdd@cmtbd_s1
@s-04-netmax-cmt-s1-sinonimos.sql
@s-04-netmax-valida-sinonimos.sql

prompt =====================================
prompt creando sinonimos para cmtbd_s2
prompt =====================================
connect netmax_bdd/netmax_bdd@cmtbd_s2
@s-04-netmax-cmt-s2-sinonimos.sql
@s-04-netmax-valida-sinonimos.sql

prompt =====================================
prompt creando sinonimos para msebd_s1
prompt =====================================
connect netmax_bdd/netmax_bdd@msebd_s1
@s-04-netmax-mse-s1-sinonimos.sql
@s-04-netmax-valida-sinonimos.sql

prompt =====================================
prompt creando sinonimos para msebd_s2
prompt =====================================
connect netmax_bdd/netmax_bdd@msebd_s2
@s-04-netmax-mse-s2-sinonimos.sql
@s-04-netmax-valida-sinonimos.sql

prompt Listo!