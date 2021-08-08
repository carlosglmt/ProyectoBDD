--@Autor: Carlos Gamaliel Morales Téllez
--@Fecha creación: 07/08/2021
--@Descripción: Archivo de carga inicial.

clear screen
whenever sqlerror exit rollback;

Prompt ======================================
Prompt Cargando catalogos replicados en cmtbd_s1
Prompt ======================================
connect netmax_bdd/netmax_bdd@cmtbd_s1
delete from status_programa;
@carga-inicial/netmax-carga-inicial-status-programa.sql
commit;

Prompt ======================================
Prompt Cargando catalogos replicados en cmtbd_s2
Prompt ======================================
connect netmax_bdd/netmax_bdd@cmtbd_s2
delete from status_programa;
@carga-inicial/netmax-carga-inicial-status-programa.sql
commit;

Prompt ======================================
Prompt Cargando catalogos replicados en msebd_s1
Prompt ======================================
connect netmax_bdd/netmax_bdd@msebd_s1
delete from status_programa;
@carga-inicial/netmax-carga-inicial-status-programa.sql
commit;

Prompt ======================================
Prompt Cargando catalogos replicados en msebd_s2
Prompt ======================================
connect netmax_bdd/netmax_bdd@msebd_s2
delete from status_programa;
@carga-inicial/netmax-carga-inicial-status-programa.sql
commit;

Prompt Carga de datos replicados exitosa!.
exit