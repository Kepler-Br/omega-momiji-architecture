--liquibase formatted sql

--changeset 45532267+kepler-br@users.noreply.github.com:init_tables
create table bot.chat_configs
(
    id                   bigserial primary key,
    created_at           timestamp     not null,
    frontend             varchar(100)  not null,
    chat_native_id       varchar(100)  not null,

    username             varchar(1024) not null,
    max_new_tokens       int           not null,
    num_beams            int           not null,
    no_repeat_ngram_size int           not null,
    temperature          float         not null,
    top_p                float         not null,
    top_k                int           not null,
    repetition_penalty   float         not null,
    reply_chance         float         not null
);

create unique index uix_chat_configs_native_id_frontend on bot.chat_configs (chat_native_id, frontend);
