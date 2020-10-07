/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     2020/10/7 13:31:47                           */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_XZ_ARTIC_RELATIONS_XZ_USERS') then
    alter table xz_artical
       delete foreign key FK_XZ_ARTIC_RELATIONS_XZ_USERS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_XZ_ARTIC_RELATIONS_XZ_ARTIC') then
    alter table xz_artical_tag
       delete foreign key FK_XZ_ARTIC_RELATIONS_XZ_ARTIC
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_XZ_FRIEN_RELATIONS_XZ_USERS') then
    alter table xz_friends
       delete foreign key FK_XZ_FRIEN_RELATIONS_XZ_USERS
end if;

drop table if exists xz_admin;

drop table if exists xz_artical;

drop table if exists xz_artical_tag;

drop table if exists xz_comments;

drop table if exists xz_friends;

drop table if exists xz_users;

/*==============================================================*/
/* Table: xz_admin                                              */
/*==============================================================*/
create table xz_admin 
(
   admin_id             integer                        not null				AUTO_INCREMENT,
   admin_login_name     varchar(20)                    null,
   admin_password       varchar(30)                    null,
   constraint PK_XZ_ADMIN primary key (admin_id)
);

/*==============================================================*/
/* Table: xz_artical                                            */
/*==============================================================*/
create table xz_artical 
(
   artical_id           integer                        not null				AUTO_INCREMENT,
   user_id              integer                        null,
   artical_title        varchar(255)                   null,
   artical_content      long varchar                   null,
   artical_view_count   integer                        null,
   aritical_like_count  integer                        null,
   artical_comment_count integer                        null,
   artical_date         date                           null,
   comment_right        smallint                       null,
   constraint PK_XZ_ARTICAL primary key (artical_id)
);

/*==============================================================*/
/* Table: xz_artical_tag                                        */
/*==============================================================*/
create table xz_artical_tag 
(
   tag_id               integer                        not null				AUTO_INCREMENT,
   artical_id           integer                        null,
   artical_tag          varchar(40)                    null,
   constraint PK_XZ_ARTICAL_TAG primary key (tag_id)
);

/*==============================================================*/
/* Table: xz_comments                                           */
/*==============================================================*/
create table xz_comments 
(
   comment_id           integer                        not null				AUTO_INCREMENT,
   user_id              integer                        null,
   artical_id           integer                        null,
   comment_content      long varchar                   null,
   comment_like_count   integer                        null,
   comment_date         timestamp                      null,
   parent_comment_id    integer                        null,
   constraint PK_XZ_COMMENTS primary key (comment_id)
);

/*==============================================================*/
/* Table: xz_friends                                            */
/*==============================================================*/
create table xz_friends 
(
   friend_id            integer                        not null				AUTO_INCREMENT,
   user_id              integer                        null,
   user_friend_id       integer                        null,
   user_friend_status   integer                        null,
   constraint PK_XZ_FRIENDS primary key (friend_id)
);

/*==============================================================*/
/* Table: xz_users                                              */
/*==============================================================*/
create table xz_users 
(
   user_id              integer                        not null				AUTO_INCREMENT,
   user_login_name      varchar(20)                    not null,
   user_password        varchar(20)                    not null,
   user_ip              varchar(30)                    not null,
   user_email           varchar(40)                    not null,
   user_nickname        varchar(20)                    null,
   user_register_time   timestamp                      null,
   user_profile_photo   varchar(255)                   null,
   user_telephone_number char(11)                       null,
   user_birthday        date                           null,
   constraint PK_XZ_USERS primary key (user_id)
);

alter table xz_artical
   add constraint FK_XZ_ARTIC_RELATIONS_XZ_USERS foreign key (user_id)
      references xz_users (user_id)
      on update restrict
      on delete restrict;

alter table xz_artical_tag
   add constraint FK_XZ_ARTIC_RELATIONS_XZ_ARTIC foreign key (artical_id)
      references xz_artical (artical_id)
      on update restrict
      on delete restrict;

alter table xz_friends
   add constraint FK_XZ_FRIEN_RELATIONS_XZ_USERS foreign key (user_id)
      references xz_users (user_id)
      on update restrict
      on delete restrict;

