--liquibase formatted sql

--changeset 45532267+kepler-br@users.noreply.github.com:init_tables
create table gateway.messages
(
    id                         bigserial primary key,
    "text"                     varchar                              null,
    media_link                 varchar                              null,
    media_type                 varchar                              null
        constraint chk_messages_media_type check (media_type in
                                                  ('STICKER', 'AUDIO', 'VOICE', 'PHOTO', 'VIDEO',
                                                   'GIF', 'VIDEO_NOTE')),
    chat_id                    bigint                               not null
        constraint fk_messages_chats_id references gateway.chats (id),
    user_id                    bigint references gateway.users (id) not null
        constraint fk_messages_users_id references gateway.users (id),
    frontend                   varchar(100)                         not null,
    native_id                  varchar(100)                         not null,
    reply_to_message_native_id varchar(100),
    created_at                 timestamp                            not null
);

create unique index uix_messages_native_id_frontend on gateway.messages (native_id, frontend);

comment on column gateway.messages.media_link is 'A link to file in S3';
