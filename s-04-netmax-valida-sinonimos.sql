--@Autor: Carlos Gamaliel Morales Téllez
--@Fecha creación: 04/08/2021
--@Descripción: Script de validación de sinónimos

Prompt validando sinonimos para USUARIO
select
    (select count(*) from USUARIO_F1) as usuario_f1,
    (select count(*) from USUARIO_F2) as usuario_f2,
    (select count(*) from USUARIO_F3) as usuario_f3,
    (select count(*) from USUARIO_F4) as usuario_f4,
    (select count(*) from USUARIO_F5) as usuario_f5
from dual;

Prompt validando sinonimos para PROGRAMA
select
    (select count(*) from PROGRAMA_F1) as programa_f1,
    (select count(*) from PROGRAMA_F2) as programa_f2,
    (select count(*) from PROGRAMA_F3) as programa_f3
from dual;

Prompt validando sinonimos para DOCUMENTAL
select
    (select count(*) from DOCUMENTAL_F1) as documental_f1,
    (select count(*) from DOCUMENTAL_F2) as documental_f2,
    (select count(*) from DOCUMENTAL_F3) as documental_f3
from dual;

Prompt validando sinonimos para PELICULA
select
    (select count(*) from PELICULA_F1) as pelicula_f1,
    (select count(*) from PELICULA_F2) as pelicula_f2,
    (select count(*) from PELICULA_F3) as pelicula_f3
from dual;

Prompt validando sinonimos para SERIE
select
    (select count(*) from SERIE_F1) as serie_f1,
    (select count(*) from SERIE_F2) as serie_f2,
    (select count(*) from SERIE_F3) as serie_f3
from dual;

Prompt validando sinonimos para HISTORICO_STATUS_PROGRAMA
select 
    (select count(*) from HISTORICO_STATUS_PROGRAMA_F1) as historico_status_programa_f1
from dual;

Prompt validando sinonimos para ARCHIVO_PROGRAMA
select
    (select count(*) from ARCHIVO_PROGRAMA_F1) as archivo_programa_f1,
    (select count(*) from ARCHIVO_PROGRAMA_F2) as archivo_programa_f2
from dual;

Prompt validando sinonimos para PLAYLIST 
select
    (select count(*) from PLAYLIST_F1) as playlist_f1,
    (select count(*) from PLAYLIST_F2) as playlist_f2,
    (select count(*) from PLAYLIST_F3) as playlist_f3,
    (select count(*) from PLAYLIST_F4) as playlist_f4
from dual;

Prompt validando sinonimos para TIPO_CUENTA
select
    (select count(*) from TIPO_CUENTA_R1) as tipo_cuenta_r1,
    (select count(*) from TIPO_CUENTA_R2) as tipo_cuenta_r2,
    (select count(*) from TIPO_CUENTA_R3) as tipo_cuenta_r3,
    (select count(*) from TIPO_CUENTA_R4) as tipo_cuenta_r4
from dual;

Prompt validando sinonimos para PAIS
select
    (select count(*) from PAIS_R1) as pais_r1,
    (select count(*) from PAIS_R2) as pais_r2,
    (select count(*) from PAIS_R3) as pais_r3,
    (select count(*) from PAIS_R4) as pais_r4
from dual;

Prompt validando sinonimos para TIPO_SERIE
select
    (select count(*) from TIPO_SERIE_R1) as tipo_serie_r1,
    (select count(*) from TIPO_SERIE_R2) as tipo_serie_r2,
    (select count(*) from TIPO_SERIE_R3) as tipo_serie_r3,
    (select count(*) from TIPO_SERIE_R4) as tipo_serie_r4
from dual;