--@Autor: Carlos Gamaliel Morales Téllez
--@Autor: Mario Alberto Suárez Espinoza
--@Fecha creación: 06/08/2021
--@Descripción: Creación de vistas para todos los sitios

clear screen
whenever sqlerror exit rollback;

prompt ===========================================
prompt Creando vistas para cmtbd_s1
prompt ===========================================
connect netmax_bdd/netmax_bdd@cmtbd_s1
@s-05-netmax-vistas.sql
@s-05-netmax-tablas-temporales.sql
@s-05-netmax-funciones-blob.sql
@s-05-netmax-cmtbd-s1-vistas-blob.sql

prompt ===========================================
prompt Creando vistas para cmtbd_s2
prompt ===========================================
prompt Creando vistas para cmtbd_s2
connect netmax_bdd/netmax_bdd@cmtbd_s2
@s-05-netmax-vistas.sql
@s-05-netmax-tablas-temporales.sql
@s-05-netmax-funciones-blob.sql
@s-05-netmax-cmtbd-s2-vistas-blob.sql

prompt ===========================================
prompt Creando vistas para msebd_s1
prompt ===========================================
prompt Creando vistas para msebd_s1
connect netmax_bdd/netmax_bdd@msebd_s1
@s-05-netmax-vistas.sql
@s-05-netmax-tablas-temporales.sql
@s-05-netmax-funciones-blob.sql
@s-05-netmax-msebd-s1-vistas-blob.sql

prompt ===========================================
prompt Creando vistas para msebd_s2
prompt ===========================================
prompt Creando vistas para msebd_s2
connect netmax_bdd/netmax_bdd@msebd_s2
@s-05-netmax-vistas.sql
@s-05-netmax-tablas-temporales.sql
@s-05-netmax-funciones-blob.sql
@s-05-netmax-msebd-s2-vistas-blob.sql
prompt Listo!