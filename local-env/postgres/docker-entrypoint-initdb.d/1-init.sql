\c "postgres"

create database "omega";

\c "omega"
create user "nonroot" with password 'nonroot';

grant all on database "omega" to "nonroot";
grant all on schema public to "nonroot";
create schema gateway;
grant all on schema gateway to "nonroot";
create schema bot;
grant all on schema bot to "nonroot";
