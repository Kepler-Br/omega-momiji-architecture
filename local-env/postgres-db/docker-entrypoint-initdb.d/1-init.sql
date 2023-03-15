\c "postgres"

create database "gateway";

\c "gateway"
create user "nonroot" with password 'nonroot';

grant all on database "gateway" to "nonroot";
grant all on schema public to "nonroot";
