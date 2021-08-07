--@Autor: Carlos Gamaliel Morales Téllez
--@Fecha creación: 04/08/2021
--@Descripción: Creación de sinónimos para MSEBD_S1

-- USUARIO
create or replace synonym usuario_f1 for usuario_f1_cmt_s1@cmtbd_s1;
create or replace synonym usuario_f2 for usuario_f2_mse_s1;
create or replace synonym usuario_f3 for usuario_f3_cmt_s2@cmtbd_s2;
create or replace synonym usuario_f4 for usuario_f4_mse_s1;
create or replace synonym usuario_f5 for usuario_f5_mse_s2@msebd_s2;

-- PROGRAMA
create or replace synonym programa_f1 for programa_f1_cmt_s1@cmtbd_s1;
create or replace synonym programa_f2 for programa_f2_mse_s1;
create or replace synonym programa_f3 for programa_f3_mse_s2@msebd_s2;

-- DOCUMENTAL
create or replace synonym documental_f1 for documental_f1_cmt_s1@cmtbd_s1;
create or replace synonym documental_f2 for documental_f2_mse_s1;
create or replace synonym documental_f3 for documental_f3_mse_s2@msebd_s2;

-- PELICULA
create or replace synonym pelicula_f1 for pelicula_f1_cmt_s1@cmtbd_s1;
create or replace synonym pelicula_f2 for pelicula_f2_mse_s1;
create or replace synonym pelicula_f3 for pelicula_f3_mse_s2@msebd_s2;

-- SERIE
create or replace synonym serie_f1 for serie_f1_cmt_s1@cmtbd_s1;
create or replace synonym serie_f2 for serie_f2_mse_s1;
create or replace synonym serie_f3 for serie_f3_mse_s2@msebd_s2;

-- HISTORICO_STATUS_PROGRAMA
create or replace synonym historico_status_programa for historico_status_programa@msebd_s2;

-- ARCHIVO_PROGRAMA
create or replace synonym archivo_programa_f1 for archivo_programa_f1_mse_s2@msebd_s2;
create or replace synonym archivo_programa_f2 for archivo_programa_f2_mse_s1;

-- PLAYLIST
create or replace synonym playlist_f1 for playlist_f1_cmt_s1@cmtbd_s1;
create or replace synonym playlist_f2 for playlist_f2_mse_s1;
create or replace synonym playlist_f3 for playlist_f3_cmt_s2@cmtbd_s2;
create or replace synonym playlist_f4 for playlist_f4_mse_s2@msebd_s2;

-- STATUS_PROGRAMA
-- COPIA MANUAL

-- TIPO_CUENTA
create or replace synonym tipo_cuenta_r1 for tipo_cuenta_r_cmt_s1@cmtbd_s1;
create or replace synonym tipo_cuenta_r2 for tipo_cuenta_r_cmt_s2@cmtbd_s2;
create or replace synonym tipo_cuenta_r3 for tipo_cuenta_r_mse_s1;
create or replace synonym tipo_cuenta_r4 for tipo_cuenta_r_mse_s2@msebd_s2;

-- PAIS
create or replace synonym pais_r1 for pais_r_cmt_s1@cmtbd_s1;
create or replace synonym pais_r2 for pais_r_cmt_s2@cmtbd_s2;
create or replace synonym pais_r3 for pais_r_mse_s1;
create or replace synonym pais_r4 for pais_r_mse_s2@msebd_s2;

-- TIPO_SERIE
create or replace synonym tipo_serie_r1 for tipo_serie_r_cmt_s1@cmtbd_s1;
create or replace synonym tipo_serie_r2 for tipo_serie_r_cmt_s2@cmtbd_s2;
create or replace synonym tipo_serie_r3 for tipo_serie_r_mse_s1;
create or replace synonym tipo_serie_r4 for tipo_serie_r_mse_s2@msebd_s2;
