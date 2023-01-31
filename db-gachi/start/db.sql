create database tmcit ;

create table tmcit.userinfo(
    user_id int auto_increment,
    user_name varchar(10),
    user_password varchar(50),
    user_mailaddress varchar(50) not NULL,
    user_deletion int,
    date_registration date,
    date_lastlogin date,
    date_deletion date,
    PRIMARY KEY (user_id)
    );
-- 変更
create table tmcit.groupinfo(
    user_id int,
    group_id int auto_increment,
    date_registration date,
    date_updated date,
    group_name varchar(32),
    FOREIGN KEY(user_id) REFERENCES userinfo(user_id)
    );

create table tmcit.taskinfo(
    user_id int auto_increment,
    group_id int,
    task_id int,
    date_registration date,
    date_limit date,
    task_name varchar(32),
    task_content varchar(144),
    FOREIGN KEY(user_id) REFERENCES userinfo(user_id)
    );
