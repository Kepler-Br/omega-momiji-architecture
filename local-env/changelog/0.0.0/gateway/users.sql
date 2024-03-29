--liquibase formatted sql

--changeset 45532267+kepler-br@users.noreply.github.com:init_tables
create table gateway.users
(
    id         bigserial primary key,
    username   varchar(1024) not null,
    fullname   varchar(1024) not null,
    frontend   varchar(100)  not null,
    native_id  varchar(100)  not null,
    created_at timestamp     null default now(),
    updated_at timestamp     null default now()
);

create unique index uix_users_native_id_frontend on gateway.users (native_id, frontend);
