--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      fi.unam
-- Project :      CMT_S2.DM1
-- Author :       carlos
--
-- Date Created : Wednesday, August 04, 2021 18:52:02
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: PAIS_R_CMT_S2 
--

CREATE TABLE PAIS_R_CMT_S2(
    PAIS_ID       NUMBER(2, 0)    NOT NULL,
    CLAVE         VARCHAR2(4)     NOT NULL,
    NOMBRE        VARCHAR2(50)    NOT NULL,
    CONTINENTE    VARCHAR2(3)     NOT NULL,
    CONSTRAINT PK10 PRIMARY KEY (PAIS_ID)
)
;



-- 
-- TABLE: PLAYLIST_F3_CMT_S2 
--

CREATE TABLE PLAYLIST_F3_CMT_S2(
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
-- TABLE: TIPO_CUENTA_R_CMT_S2 
--

CREATE TABLE TIPO_CUENTA_R_CMT_S2(
    TIPO_CUENTA_ID    NUMBER(2, 0)     NOT NULL,
    CLAVE             VARCHAR2(40)     NOT NULL,
    DESCRIPCION       VARCHAR2(500)    NOT NULL,
    COSTO_MENSUAL     NUMBER(10, 2)    NOT NULL,
    CONSTRAINT PK11 PRIMARY KEY (TIPO_CUENTA_ID)
)
;



-- 
-- TABLE: TIPO_SERIE_R_CMT_S2 
--

CREATE TABLE TIPO_SERIE_R_CMT_S2(
    TIPO_SERIE_ID    NUMBER(2, 0)     NOT NULL,
    CLAVE            VARCHAR2(40)     NOT NULL,
    DESCRIPCION      VARCHAR2(500)    NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY (TIPO_SERIE_ID)
)
;



-- 
-- TABLE: USUARIO_F3_CMT_S2 
--

CREATE TABLE USUARIO_F3_CMT_S2(
    USUARIO_ID          NUMBER(10, 0)    NOT NULL,
    EMAIL               VARCHAR2(200)    NOT NULL,
    NOMBRE              VARCHAR2(40)     NOT NULL,
    AP_PATERNO          VARCHAR2(40)     NOT NULL,
    AP_MATERNO          VARCHAR2(40)     NOT NULL,
    FECHA_INGRESO       DATE             NOT NULL,
    FECHA_CUENTA_FIN    DATE,
    VIGENTE             NUMBER(1, 0)     NOT NULL,
    TIPO_CUENTA_ID      NUMBER(2, 0)     NOT NULL,
    CONSTRAINT PK1_1_1 PRIMARY KEY (USUARIO_ID)
)
;



-- 
-- TABLE: PLAYLIST_F3_CMT_S2 
--

ALTER TABLE PLAYLIST_F3_CMT_S2 ADD CONSTRAINT RefUSUARIO_F3_CMT_S21 
    FOREIGN KEY (USUARIO_ID)
    REFERENCES USUARIO_F3_CMT_S2(USUARIO_ID)
;


-- 
-- TABLE: USUARIO_F3_CMT_S2 
--

ALTER TABLE USUARIO_F3_CMT_S2 ADD CONSTRAINT RefTIPO_CUENTA_R_CMT_S22 
    FOREIGN KEY (TIPO_CUENTA_ID)
    REFERENCES TIPO_CUENTA_R_CMT_S2(TIPO_CUENTA_ID)
;


