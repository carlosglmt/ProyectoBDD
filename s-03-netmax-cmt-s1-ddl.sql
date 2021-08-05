--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      fi.unam
-- Project :      CMTBD_S1.DM1
-- Author :       carlos
--
-- Date Created : Wednesday, August 04, 2021 18:45:39
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: DOCUMENTAL_F1_CMT_S1 
--

CREATE TABLE DOCUMENTAL_F1_CMT_S1(
    PROGRAMA_ID    NUMBER(10, 0)    NOT NULL,
    TEMATICA       VARCHAR2(100)    NOT NULL,
    DURACION       NUMBER(5, 2)     NOT NULL,
    TRAILER        BLOB             NOT NULL,
    PAIS_ID        NUMBER(2, 0)     NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY (PROGRAMA_ID)
)
;



-- 
-- TABLE: PAIS_R_CMT_S1 
--

CREATE TABLE PAIS_R_CMT_S1(
    PAIS_ID       NUMBER(2, 0)    NOT NULL,
    CLAVE         VARCHAR2(4)     NOT NULL,
    NOMBRE        VARCHAR2(50)    NOT NULL,
    CONTINENTE    VARCHAR2(3)     NOT NULL,
    CONSTRAINT PK10 PRIMARY KEY (PAIS_ID)
)
;



-- 
-- TABLE: PELICULA_F1_CMT_S1 
--

CREATE TABLE PELICULA_F1_CMT_S1(
    PROGRAMA_ID                NUMBER(10, 0)    NOT NULL,
    DURACION                   NUMBER(5, 2)     NOT NULL,
    SINOPSIS                   VARCHAR2(500)    NOT NULL,
    CLASIFICACION              CHAR(1)          NOT NULL,
    PELICULA_ANTECEDENTE_ID    NUMBER(10, 0),
    CONSTRAINT PK3 PRIMARY KEY (PROGRAMA_ID)
)
;



-- 
-- TABLE: PLAYLIST_F1_CMT_S1 
--

CREATE TABLE PLAYLIST_F1_CMT_S1(
    PLAYLIST_ID           NUMBER(10, 0)    NOT NULL,
    CALIFICACION          NUMBER(1, 0)     NOT NULL,
    INDICE                NUMBER(10, 0)    NOT NULL,
    NUM_REPRODUCCIONES    NUMBER(10, 0)    NOT NULL,
    PROGRAMA_ID           NUMBER(10, 0)    NOT NULL,
    USUARIO_ID            NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PK7_1 PRIMARY KEY (PLAYLIST_ID)
)
;



-- 
-- TABLE: PROGRAMA_F1_CMT_S1 
--

CREATE TABLE PROGRAMA_F1_CMT_S1(
    PROGRAMA_ID           NUMBER(10, 0)    NOT NULL,
    FOLIO                 VARCHAR2(13)     NOT NULL,
    NOMBRE                VARCHAR2(100)    NOT NULL,
    DESCRIPCION           VARCHAR2(500)    NOT NULL,
    FECHA_STATUS          DATE             NOT NULL,
    TIPO                  CHAR(1)          NOT NULL,
    STATUS_PROGRAMA_ID    NUMBER(2, 0)     NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY (PROGRAMA_ID)
)
;



-- 
-- TABLE: SERIE_F1_CMT_S1 
--

CREATE TABLE SERIE_F1_CMT_S1(
    PROGRAMA_ID          NUMBER(10, 0)    NOT NULL,
    NUM_CAPITULOS        NUMBER(3, 0)     NOT NULL,
    DURACION_CAPITULO    NUMBER(5, 2)     NOT NULL,
    TIPO_SERIE_ID        NUMBER(2, 0)     NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY (PROGRAMA_ID)
)
;



-- 
-- TABLE: STATUS_PROGRAMA 
--

CREATE TABLE STATUS_PROGRAMA(
    STATUS_PROGRAMA_ID    NUMBER(2, 0)     NOT NULL,
    CLAVE                 VARCHAR2(40)     NOT NULL,
    DESCRIPCION           VARCHAR2(500)    NOT NULL,
    CONSTRAINT PK9 PRIMARY KEY (STATUS_PROGRAMA_ID)
)
;



-- 
-- TABLE: TIPO_CUENTA_R_CMT_S1 
--

CREATE TABLE TIPO_CUENTA_R_CMT_S1(
    TIPO_CUENTA_ID    NUMBER(2, 0)     NOT NULL,
    CLAVE             VARCHAR2(40)     NOT NULL,
    DESCRIPCION       VARCHAR2(500)    NOT NULL,
    COSTO_MENSUAL     NUMBER(10, 2)    NOT NULL,
    CONSTRAINT PK11 PRIMARY KEY (TIPO_CUENTA_ID)
)
;



-- 
-- TABLE: TIPO_SERIE_R_CMT_S1 
--

CREATE TABLE TIPO_SERIE_R_CMT_S1(
    TIPO_SERIE_ID    NUMBER(2, 0)     NOT NULL,
    CLAVE            VARCHAR2(40)     NOT NULL,
    DESCRIPCION      VARCHAR2(500)    NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY (TIPO_SERIE_ID)
)
;



-- 
-- TABLE: USUARIO_F1_CMT_S1 
--

CREATE TABLE USUARIO_F1_CMT_S1(
    USUARIO_ID          NUMBER(10, 0)    NOT NULL,
    EMAIL               VARCHAR2(200)    NOT NULL,
    NOMBRE              VARCHAR2(40)     NOT NULL,
    AP_PATERNO          VARCHAR2(40)     NOT NULL,
    AP_MATERNO          VARCHAR2(40)     NOT NULL,
    FECHA_INGRESO       DATE             NOT NULL,
    FECHA_CUENTA_FIN    DATE,
    VIGENTE             NUMBER(1, 0)     NOT NULL,
    TIPO_CUENTA_ID      NUMBER(2, 0)     NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY (USUARIO_ID)
)
;



-- 
-- TABLE: DOCUMENTAL_F1_CMT_S1 
--

ALTER TABLE DOCUMENTAL_F1_CMT_S1 ADD CONSTRAINT RefPROGRAMA_F1_CMT_S11 
    FOREIGN KEY (PROGRAMA_ID)
    REFERENCES PROGRAMA_F1_CMT_S1(PROGRAMA_ID)
;

ALTER TABLE DOCUMENTAL_F1_CMT_S1 ADD CONSTRAINT RefPAIS_R_CMT_S15 
    FOREIGN KEY (PAIS_ID)
    REFERENCES PAIS_R_CMT_S1(PAIS_ID)
;


-- 
-- TABLE: PELICULA_F1_CMT_S1 
--

ALTER TABLE PELICULA_F1_CMT_S1 ADD CONSTRAINT RefPROGRAMA_F1_CMT_S12 
    FOREIGN KEY (PROGRAMA_ID)
    REFERENCES PROGRAMA_F1_CMT_S1(PROGRAMA_ID)
;


-- 
-- TABLE: PLAYLIST_F1_CMT_S1 
--

ALTER TABLE PLAYLIST_F1_CMT_S1 ADD CONSTRAINT RefUSUARIO_F1_CMT_S14 
    FOREIGN KEY (USUARIO_ID)
    REFERENCES USUARIO_F1_CMT_S1(USUARIO_ID)
;


-- 
-- TABLE: PROGRAMA_F1_CMT_S1 
--

ALTER TABLE PROGRAMA_F1_CMT_S1 ADD CONSTRAINT RefSTATUS_PROGRAMA8 
    FOREIGN KEY (STATUS_PROGRAMA_ID)
    REFERENCES STATUS_PROGRAMA(STATUS_PROGRAMA_ID)
;


-- 
-- TABLE: SERIE_F1_CMT_S1 
--

ALTER TABLE SERIE_F1_CMT_S1 ADD CONSTRAINT RefPROGRAMA_F1_CMT_S13 
    FOREIGN KEY (PROGRAMA_ID)
    REFERENCES PROGRAMA_F1_CMT_S1(PROGRAMA_ID)
;

ALTER TABLE SERIE_F1_CMT_S1 ADD CONSTRAINT RefTIPO_SERIE_R_CMT_S16 
    FOREIGN KEY (TIPO_SERIE_ID)
    REFERENCES TIPO_SERIE_R_CMT_S1(TIPO_SERIE_ID)
;


-- 
-- TABLE: USUARIO_F1_CMT_S1 
--

ALTER TABLE USUARIO_F1_CMT_S1 ADD CONSTRAINT RefTIPO_CUENTA_R_CMT_S17 
    FOREIGN KEY (TIPO_CUENTA_ID)
    REFERENCES TIPO_CUENTA_R_CMT_S1(TIPO_CUENTA_ID)
;


