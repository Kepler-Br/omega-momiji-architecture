--liquibase formatted sql

--changeset 45532267+kepler-br@users.noreply.github.com:init_tables
create table gateway.chats
(
    id         bigserial primary key,
    title      varchar(1024) not null,
    frontend   varchar(100)  not null,
    native_id  varchar(100)  not null,
    "type"     varchar(100)  not null
        constraint chk_chats_type check ("type" in ('PRIVATE', 'GROUP')),
    created_at timestamp     null default now(),
    updated_at timestamp     null default now()
);

create unique index uix_chats_native_id_frontend on gateway.chats (native_id, frontend);
