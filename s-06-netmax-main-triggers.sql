--@Autor: Carlos Gamaliel Morales Téllez
--@Fecha creación: 07/08/2021
--@Descripción: Script principal - creación de triggers
clear screen
whenever sqlerror exit rollback;

prompt =====================================
prompt Creando triggers para cmtbd_s1
prompt =====================================
connect netmax_bdd/netmax_bdd@cmtbd_s1
@s-06-netmax-trigger-usuario.sql
@s-06-netmax-trigger-programa.sql
@s-06-netmax-trigger-cmtbd-s1-serie.sql
@s-06-netmax-trigger-cmtbd-s1-pelicula.sql
@s-06-netmax-trigger-cmtbd-s1-documental.sql
@s-06-netmax-trigger-cmtbd-s1-archivo-programa.sql
@s-06-netmax-trigger-cmtbd-s1-playlist.sql
@s-06-netmax-trigger-tipo-cuenta.sql
@s-06-netmax-trigger-tipo-serie.sql
@s-06-netmax-trigger-pais.sql

prompt =====================================
prompt Creando triggers para cmtbd_s2
prompt =====================================
connect netmax_bdd/netmax_bdd@cmtbd_s2
@s-06-netmax-trigger-usuario.sql
@s-06-netmax-trigger-programa.sql
@s-06-netmax-trigger-cmtbd-s2-serie.sql
@s-06-netmax-trigger-cmtbd-s2-pelicula.sql
@s-06-netmax-trigger-cmtbd-s2-documental.sql
@s-06-netmax-trigger-cmtbd-s2-archivo-programa.sql
@s-06-netmax-trigger-cmtbd-s2-playlist.sql
@s-06-netmax-trigger-tipo-cuenta.sql
@s-06-netmax-trigger-tipo-serie.sql
@s-06-netmax-trigger-pais.sql

prompt =====================================
prompt Creando triggers para msebd_s1
prompt =====================================
connect netmax_bdd/netmax_bdd@cmtbd_s1
@s-06-netmax-trigger-usuario.sql
@s-06-netmax-trigger-programa.sql
@s-06-netmax-trigger-msebd-s1-serie.sql
@s-06-netmax-trigger-msebd-s1-pelicula.sql
@s-06-netmax-trigger-msebd-s1-documental.sql
@s-06-netmax-trigger-msebd-s1-archivo-programa.sql
@s-06-netmax-trigger-msebd-s1-playlist.sql
@s-06-netmax-trigger-tipo-cuenta.sql
@s-06-netmax-trigger-tipo-serie.sql
@s-06-netmax-trigger-pais.sql

prompt =====================================
prompt Creando triggers para msebd_s2
prompt =====================================
connect netmax_bdd/netmax_bdd@cmtbd_s2
@s-06-netmax-trigger-usuario.sql
@s-06-netmax-trigger-programa.sql
@s-06-netmax-trigger-msebd-s2-serie.sql
@s-06-netmax-trigger-msebd-s2-pelicula.sql
@s-06-netmax-trigger-msebd-s2-documental.sql
@s-06-netmax-trigger-msebd-s2-archivo-programa.sql
@s-06-netmax-trigger-msebd-s2-playlist.sql
@s-06-netmax-trigger-tipo-cuenta.sql
@s-06-netmax-trigger-tipo-serie.sql
@s-06-netmax-trigger-pais.sql
prompt Listo!
