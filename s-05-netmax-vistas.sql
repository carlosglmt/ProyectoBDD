--@Autor: Carlos Gamaliel Morales Téllez
--@Fecha creación: 04/08/2021
--@Descripción: Creación de vistas comunes a todos los nodos.
--              Se excluyen las vistas que contienen columnas BLOB

-- USUARIO
Prompt creando vista USUARIO
create or replace view USUARIO as
    select q1.usuario_id, q1.email, q1.nombre,
        q1.ap_paterno, q1.ap_materno, u4.password,
        q1.fecha_ingreso, q1.fecha_cuenta_fin, 
        q1.vigente, u4.num_tarjeta, q1.tipo_cuenta_id
    from (
        select u1.usuario_id, u1.email, u1.nombre,
            u1.ap_paterno, u1.ap_materno, u1.fecha_ingreso,
            u1.fecha_cuenta_fin, u1.vigente, u1.tipo_cuenta_id
        from usuario_f1 u1
        union all 
        select u2.usuario_id, u2.email, u2.nombre,
            u2.ap_paterno, u2.ap_materno, u2.fecha_ingreso,
            u2.fecha_cuenta_fin, u2.vigente, u2.tipo_cuenta_id
        from usuario_f2 u2
        union all
        select u3.usuario_id, u3.email, u3.nombre,
            u3.ap_paterno, u3.ap_materno, u3.fecha_ingreso,
            u3.fecha_cuenta_fin, u3.vigente, u3.tipo_cuenta_id
        from usuario_f3 u3
        union all
        select u5.usuario_id, u5.email, u5.nombre,
            u5.ap_paterno, u5.ap_materno, u5.fecha_ingreso,
            u5.fecha_cuenta_fin, u5.vigente, u5.tipo_cuenta_id
        from usuario_f5 u5
    ) q1 join usuario_f4 u4
    on q1.usuario_id = u4.usuario_id;

-- DOCUMENTAL <- Tiene datos de tipo BLOB

-- PROGRAMA
create or replace view PROGRAMA as
    select p1.programa_id, p1.folio, p1.nombere, p1.descripcion,
        p1.fecha_status, p1.tipo, p1.status_programa_id
    from programa_f1 p1
    union all 
    select p2.programa_id, p2.folio, p2.nombere, p2.descripcion,
        p2.fecha_status, p2.tipo, p2.status_programa_id
    from programa_f2 p2
    union all
    select p3.programa_id, p3.folio, p3.nombere, p3.descripcion,
        p3.fecha_status, p3.tipo, p3.status_programa_id
    from programa_f3 p3;

-- PELICULA
create or replace view PELICULA as
    select p1.programa_id, p1.duracion, p1.sinopsis, 
        p1.clasificacion, p1.pelicula_antecedente_id
    from pelicula_f1
    union all
    select p2.programa_id, p2.duracion, p2.sinopsis, 
        p2.clasificacion, p2.pelicula_antecedente_id
    from pelicula_f2
    union all
    select p3.programa_id, p3.duracion, p3.sinopsis, 
        p3.clasificacion, p3.pelicula_antecedente_id
    from pelicula_f3;

-- SERIE
create or replace view SERIE as
    select s1.programa_id, s1.num_capitulos, 
        s1.duracion_capitulo, s1.tipo_serie
    from serie_f1 s1
    union all
    select s2.programa_id, s2.num_capitulos, 
        s2.duracion_capitulo, s2.tipo_serie
    from serie_f2 s2
    union all
    select s3.programa_id, s3.num_capitulos, 
        s3.duracion_capitulo, s3.tipo_serie
    from serie_f3 s3;

-- HISTORICO_STATUS_PROGRAMA <- No está fragmentada, 
--                              con el sinónimo es 
--                              suficiente.

-- ARCHIVO_PROGRAMA <- Tiene datos de tipo BLOB

-- PLAYLIST
create or replace view PLAYLIST as
    select p1.playlist_id, p1.calificacion, 
        p1.indice, p1.num_reproducciones,
        p1.programa_id, p1.usuario_id
    from playlist_f1 p1
    union all 
    select p2.playlist_id, p2.calificacion, 
        p2.indice, p2.num_reproducciones,
        p2.programa_id, p2.usuario_id
    from playlist_f2 p2
    union all
    select p3.playlist_id, p3.calificacion, 
        p3.indice, p3.num_reproducciones,
        p3.programa_id, p3.usuario_id
    from playlist_f3 p3
    select p4.playlist_id, p4.calificacion, 
        p4.indice, p4.num_reproducciones,
        p4.programa_id, p4.usuario_id
    from playlist_f4 p4;

-- STATUS_PROGRAMA <- Copia manual

-- TIPO_CUENTA <- Tabla replicada

-- PAIS <- Tabla replicada

-- TIPO_SERIE <- Tabla replicada

