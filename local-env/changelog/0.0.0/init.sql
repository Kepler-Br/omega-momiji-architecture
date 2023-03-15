--liquibase formatted sql

--changeset 45532267+kepler-br@users.noreply.github.com:init_tables
create table users
(
    id        serial primary key,
    username  varchar(1024) not null,
    fullname  varchar(1024) not null,
    frontend  varchar(100)  not null,
    native_id varchar(100)  not null
)
;

create unique index uix_users_native_id_frontend on users (native_id, frontend);

create table chats
(
    id        serial primary key,
    title     varchar(1024) not null,
    frontend  varchar(100)  not null,
    native_id varchar(100)  not null,
    "type"    varchar(100)  not null
        constraint chk_chats_type check ("type" in ('PRIVATE', 'GROUP'))
)
;

create unique index uix_chats_native_id_frontend on chats (native_id, frontend);

create table messages
(
    id         serial primary key,
    "text"     varchar                      null,
    media_link varchar                      null,
    media_type varchar                      null
        constraint chk_messages_media_type check (media_type in
                                                  ('STICKER', 'AUDIO', 'VOICE', 'PICTURE', 'MUSIC',
                                                   'VIDEO')),
    chat_id    serial                       not null
        constraint fk_messages_chats_id references chats (id),
    user_id    serial references users (id) not null
        constraint fk_messages_users_id references users (id),
    frontend   varchar(100)                 not null,
    native_id  varchar(100)                 not null
)
;

create unique index uix_messages_native_id_frontend on messages (native_id, frontend);

comment on column messages.media_link is 'A link to file in S3';
