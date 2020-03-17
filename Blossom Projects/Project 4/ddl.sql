create schema stackoverflow_filtered;

set search_path to stackoverflow_filtered;

create table results(
users_id int4 not null primary key,
display_name text null,
reputation text null,
website_url text null,
"location" text not null,
about_me text null,
"views" int4 null,
up_votes int4 null,
down_votes int4 null,
image_url text null,
users_created_at timestamp null,
updated_at timestamp not null,
city text not null,
country text not null,
questions_id int4 not null,
questions_user_id int4 not null,
title text null,
questions_body text null,
accepted_answer_id int4 null,
qusetions_score int4 null,
view_count int4 not null default 0,
questions_comment_count int4 null,
questions_created_at timestamp null,
answers_id int4 not null,
answers_user_id int4 null,
question_id int4 not null,
answers_body text null,
answers_score int4 null,
answers_comment_count int4 null,
answers_created_at timestamp null
);

create index rep_dex on results (reputation);
create index disp_dex on results using hash (display_name);

create view results_view as select
display_name, city, questions_id from stackoverflow_filtered.results 
where accepted_answer_id is not null;

create view results_view as select
display_name, city, questions_id from 
stackoverflow_filtered.results where 
accepted_answer_id is not null;

create materialized view results_view_mat as select
display_name, city, questions_id from 
stackoverflow_filtered.results where 
accepted_answer_id is not null;






