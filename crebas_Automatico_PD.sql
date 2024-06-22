/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     08/10/2021 11:36:34 a. m.                    */
/*==============================================================*/


alter table FINCAS__FIN_
   drop constraint FK_FINCAS___FIN_FK_ID_LOCACION;

alter table FINCAS__FIN_
   drop constraint FK_FINCAS___FIN_FK_ID_PERSONAS;

alter table HISTORIAL_CLINICO__HICL_
   drop constraint FK_HISTORIA_HICL_FK_I_COMPLICA;

alter table HISTORIAL_CLINICO__HICL_
   drop constraint FK_HISTORIA_HICL_FK_I_RESES__R;

alter table HISTORIAL_CLINICO__HICL_
   drop constraint FK_HISTORIA_HICL_FK_I_PERSONAS;

alter table LOCACIONES__LOC_
   drop constraint FK_LOCACION_MUN_FK_ID_MUNICIPI;

alter table RESES__RES_
   drop constraint FK_RESES__R_RES_FK_ID_ESPECIES;

alter table RESES__RES_
   drop constraint FK_RESES__R_RES_FK_ID_FINCAS__;

alter table RESES__RES_
   drop constraint FK_RESES__R_RES_FK_ID_REGISTRO;

alter table RESES__RES_
   drop constraint FK_RESES__R_RES_FK_ID_VENTAS__;

alter table VENTAS__VEN_
   drop constraint FK_VENTAS___VEN_FK_ID_PERSONAS;

drop table COMPLICACIONES_MEDICAS__COME_ cascade constraints;

drop table ESPECIES_RES__ESRE_ cascade constraints;

drop index FIN_FK_IDTR_FK;

drop index FIN_FK_IDLO_FK;

drop table FINCAS__FIN_ cascade constraints;

drop index HICL_FK_IDCM_FK;

drop index HICL_FK_IDRE_FK;

drop index HICL_FK_IDVR_FK;

drop table HISTORIAL_CLINICO__HICL_ cascade constraints;

drop index MUN_FK_IDLO_FK;

drop table LOCACIONES__LOC_ cascade constraints;

drop table MUNICIPIOS__MUN_ cascade constraints;

drop table PERSONAS__PER_ cascade constraints;

drop table REGISTROS__REG_ cascade constraints;

drop index RES_FK_IDFI_FK;

drop index RES_FK_IDVE_FK;

drop index RES_FK_IDER_FK;

drop index RES_FK_IDRG_FK;

drop table RESES__RES_ cascade constraints;

drop index VEN_FK_IDCO_FK;

drop table VENTAS__VEN_ cascade constraints;

/*==============================================================*/
/* Table: COMPLICACIONES_MEDICAS__COME_                         */
/*==============================================================*/
create table COMPLICACIONES_MEDICAS__COME_ 
(
   ID_COMPLICACION_MEDICA NUMBER(11)           not null,
   NOMBRE_COMPLICACION  VARCHAR2(30)         not null,
   TIPO_COMPLICACION    CHAR(1)              not null,
   DESCRIPCION          VARCHAR2(30),
   constraint PK_COMPLICACIONES_MEDICAS__COM primary key (ID_COMPLICACION_MEDICA)
);

/*==============================================================*/
/* Table: ESPECIES_RES__ESRE_                                   */
/*==============================================================*/
create table ESPECIES_RES__ESRE_ 
(
   ID_ESPECIE           NUMBER(11)           not null,
   NOMBRE_ESPECIE       VARCHAR2(30)         not null,
   constraint PK_ESPECIES_RES__ESRE_ primary key (ID_ESPECIE)
);

/*==============================================================*/
/* Table: FINCAS__FIN_                                          */
/*==============================================================*/
create table FINCAS__FIN_ 
(
   ID_FINCA             NUMBER(11)           not null,
   ID_LOCACION          NUMBER(11)           not null,
   ID_TRABAJADOR        NUMBER(11)           not null,
   NOMBRE_FINCA         VARCHAR2(30)         not null,
   constraint PK_FINCAS__FIN_ primary key (ID_FINCA)
);

/*==============================================================*/
/* Index: FIN_FK_IDLO_FK                                        */
/*==============================================================*/
create index FIN_FK_IDLO_FK on FINCAS__FIN_ (
   ID_LOCACION ASC
);

/*==============================================================*/
/* Index: FIN_FK_IDTR_FK                                        */
/*==============================================================*/
create index FIN_FK_IDTR_FK on FINCAS__FIN_ (
   ID_TRABAJADOR ASC
);

/*==============================================================*/
/* Table: HISTORIAL_CLINICO__HICL_                              */
/*==============================================================*/
create table HISTORIAL_CLINICO__HICL_ 
(
   ID_VETERINARIO       NUMBER(11)           not null,
   ID_RES               NUMBER(11)           not null,
   ID_COMPLICACION_MEDICA NUMBER(11)           not null,
   COSTO_REVISION       NUMBER(5)            not null,
   FECHA_REVISION       DATE                 not null,
   FECHA_MUERTE         DATE
);

/*==============================================================*/
/* Index: HICL_FK_IDVR_FK                                       */
/*==============================================================*/
create index HICL_FK_IDVR_FK on HISTORIAL_CLINICO__HICL_ (
   ID_VETERINARIO ASC
);

/*==============================================================*/
/* Index: HICL_FK_IDRE_FK                                       */
/*==============================================================*/
create index HICL_FK_IDRE_FK on HISTORIAL_CLINICO__HICL_ (
   ID_RES ASC
);

/*==============================================================*/
/* Index: HICL_FK_IDCM_FK                                       */
/*==============================================================*/
create index HICL_FK_IDCM_FK on HISTORIAL_CLINICO__HICL_ (
   ID_COMPLICACION_MEDICA ASC
);

/*==============================================================*/
/* Table: LOCACIONES__LOC_                                      */
/*==============================================================*/
create table LOCACIONES__LOC_ 
(
   ID_LOCACION          NUMBER(11)           not null,
   ID_MUNICIPIO         NUMBER(11)           not null,
   DIRECCION            VARCHAR2(30)         not null,
   constraint PK_LOCACIONES__LOC_ primary key (ID_LOCACION)
);

/*==============================================================*/
/* Index: MUN_FK_IDLO_FK                                        */
/*==============================================================*/
create index MUN_FK_IDLO_FK on LOCACIONES__LOC_ (
   ID_MUNICIPIO ASC
);

/*==============================================================*/
/* Table: MUNICIPIOS__MUN_                                      */
/*==============================================================*/
create table MUNICIPIOS__MUN_ 
(
   ID_MUNICIPIO         NUMBER(11)           not null,
   NOMBRE_MUNICIPIO     VARCHAR2(30)         not null,
   constraint PK_MUNICIPIOS__MUN_ primary key (ID_MUNICIPIO)
);

/*==============================================================*/
/* Table: PERSONAS__PER_                                        */
/*==============================================================*/
create table PERSONAS__PER_ 
(
   ID_PERSONA           NUMBER(11)           not null,
   NOMBRE_PERSONA       VARCHAR2(30),
   APELLIDO_PERSONA     VARCHAR2(30)         not null,
   TELEFONO_PERSONA     VARCHAR2(30)         not null,
   TIPO_PERSONA         CHAR(1)              not null,
   SALARIO              NUMBER(8,2),
   constraint PK_PERSONAS__PER_ primary key (ID_PERSONA)
);

/*==============================================================*/
/* Table: REGISTROS__REG_                                       */
/*==============================================================*/
create table REGISTROS__REG_ 
(
   ID_REGISTRO          NUMBER(11)           not null,
   FECHA_LLEGADA        DATE                 not null,
   constraint PK_REGISTROS__REG_ primary key (ID_REGISTRO)
);

/*==============================================================*/
/* Table: RESES__RES_                                           */
/*==============================================================*/
create table RESES__RES_ 
(
   ID_RES               NUMBER(11)           not null,
   NOMBRE_RES           VARCHAR2(30),
   GENERO               CHAR(1)              not null,
   COLOR                VARCHAR2(30)         not null,
   FECHA_NACIMINETO     DATE                 not null,
   ID_REGISTRO          NUMBER(11)           not null,
   ID_ESPECIE           NUMBER(11)           not null,
   ID_VENTA             NUMBER(11),
   ID_FINCA             NUMBER(11)           not null,
   constraint PK_RESES__RES_ primary key (ID_RES)
);

/*==============================================================*/
/* Index: RES_FK_IDRG_FK                                        */
/*==============================================================*/
create index RES_FK_IDRG_FK on RESES__RES_ (
   ID_REGISTRO ASC
);

/*==============================================================*/
/* Index: RES_FK_IDER_FK                                        */
/*==============================================================*/
create index RES_FK_IDER_FK on RESES__RES_ (
   ID_ESPECIE ASC
);

/*==============================================================*/
/* Index: RES_FK_IDVE_FK                                        */
/*==============================================================*/
create index RES_FK_IDVE_FK on RESES__RES_ (
   ID_VENTA ASC
);

/*==============================================================*/
/* Index: RES_FK_IDFI_FK                                        */
/*==============================================================*/
create index RES_FK_IDFI_FK on RESES__RES_ (
   ID_FINCA ASC
);

/*==============================================================*/
/* Table: VENTAS__VEN_                                          */
/*==============================================================*/
create table VENTAS__VEN_ 
(
   ID_VENTA             NUMBER(11)           not null,
   ID_COMPRADOR         NUMBER(11)           not null,
   VALOR_VENTA          NUMBER(8)            not null,
   FECHA                DATE                 not null,
   constraint PK_VENTAS__VEN_ primary key (ID_VENTA)
);

/*==============================================================*/
/* Index: VEN_FK_IDCO_FK                                        */
/*==============================================================*/
create index VEN_FK_IDCO_FK on VENTAS__VEN_ (
   ID_COMPRADOR ASC
);

alter table FINCAS__FIN_
   add constraint FK_FINCAS___FIN_FK_ID_LOCACION foreign key (ID_LOCACION)
      references LOCACIONES__LOC_ (ID_LOCACION);

alter table FINCAS__FIN_
   add constraint FK_FINCAS___FIN_FK_ID_PERSONAS foreign key (ID_TRABAJADOR)
      references PERSONAS__PER_ (ID_PERSONA);

alter table HISTORIAL_CLINICO__HICL_
   add constraint FK_HISTORIA_HICL_FK_I_COMPLICA foreign key (ID_COMPLICACION_MEDICA)
      references COMPLICACIONES_MEDICAS__COME_ (ID_COMPLICACION_MEDICA);

alter table HISTORIAL_CLINICO__HICL_
   add constraint FK_HISTORIA_HICL_FK_I_RESES__R foreign key (ID_RES)
      references RESES__RES_ (ID_RES);

alter table HISTORIAL_CLINICO__HICL_
   add constraint FK_HISTORIA_HICL_FK_I_PERSONAS foreign key (ID_VETERINARIO)
      references PERSONAS__PER_ (ID_PERSONA);

alter table LOCACIONES__LOC_
   add constraint FK_LOCACION_MUN_FK_ID_MUNICIPI foreign key (ID_MUNICIPIO)
      references MUNICIPIOS__MUN_ (ID_MUNICIPIO);

alter table RESES__RES_
   add constraint FK_RESES__R_RES_FK_ID_ESPECIES foreign key (ID_ESPECIE)
      references ESPECIES_RES__ESRE_ (ID_ESPECIE);

alter table RESES__RES_
   add constraint FK_RESES__R_RES_FK_ID_FINCAS__ foreign key (ID_FINCA)
      references FINCAS__FIN_ (ID_FINCA);

alter table RESES__RES_
   add constraint FK_RESES__R_RES_FK_ID_REGISTRO foreign key (ID_REGISTRO)
      references REGISTROS__REG_ (ID_REGISTRO);

alter table RESES__RES_
   add constraint FK_RESES__R_RES_FK_ID_VENTAS__ foreign key (ID_VENTA)
      references VENTAS__VEN_ (ID_VENTA);

alter table VENTAS__VEN_
   add constraint FK_VENTAS___VEN_FK_ID_PERSONAS foreign key (ID_COMPRADOR)
      references PERSONAS__PER_ (ID_PERSONA);

