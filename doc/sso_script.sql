--------------------------------------------
-- Export file for user SSO               --
-- Created by yohn on 2010/11/7, 19:51:19 --
--------------------------------------------

spool sso_script.log

prompt
prompt Creating table SSO_LOGIN_LOG
prompt ============================
prompt
create table SSO_LOGIN_LOG
(
  SEQ_ID         NUMBER(38) not null,
  PRINCIPAL_ID   VARCHAR2(4000),
  AUTH_TYPE      VARCHAR2(256),
  PRINCIPAL_ATTR VARCHAR2(4000),
  LOGIN_TIME     DATE default sysdate,
  TICKET_ID      VARCHAR2(256),
  RETURN_URL     VARCHAR2(4000),
  LOGOUT_URL     VARCHAR2(4000),
  APP_ID         VARCHAR2(256),
  HOST_NAME      VARCHAR2(4000)
)
;
alter table SSO_LOGIN_LOG
  add constraint PK_SSO_LOGIN_LOG primary key (SEQ_ID);

prompt
prompt Creating table SSO_LOGOUT_LOG
prompt =============================
prompt
create table SSO_LOGOUT_LOG
(
  SEQ_ID          NUMBER(38) not null,
  TICKET_ID       VARCHAR2(256),
  LOGOUT_TIME     DATE default sysdate,
  LOGOUT_SERVICES VARCHAR2(4000),
  HOST_NAME      VARCHAR2(4000)
)
;
alter table SSO_LOGOUT_LOG
  add constraint PK_SSO_LOGOUT_LOG primary key (SEQ_ID);

prompt
prompt Creating table SSO_TICKET_REGISTRY
prompt ==================================
prompt
create table SSO_TICKET_REGISTRY
(
  SEQ_ID      NUMBER(38) not null,
  TICKET_ID   VARCHAR2(256) not null,
  TICKET      BLOB not null,
  TICKET_TYPE VARCHAR2(200) not null,
  CREATE_TIME DATE default sysdate,
  HOST_NAME      VARCHAR2(4000)
)
;
alter table SSO_TICKET_REGISTRY
  add constraint PK_SSO_TICKET_REGISTRY primary key (SEQ_ID);
create unique index IDX_SSO_TICKET_REGISTRY_U01 on SSO_TICKET_REGISTRY (TICKET_ID);

prompt
prompt Creating sequence S_SSO_ID
prompt ==========================
prompt
create sequence S_SSO_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 121
increment by 1
cache 20;


spool off
