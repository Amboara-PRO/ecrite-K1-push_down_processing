CREATE DATABASE garage_db;

create user "garage_db_manager" with password '123456';

grant connect on database garage_db to garage_db_manager;

\c garage_coreen_db;

    grant create on schema public to garage_db_manager;

alter default privileges in schema public grant select, insert, update, delete on tables to garage_db_manager;

alter default privileges in schema public grant usage, select, update on sequences to garage_db_manager;