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

create table tmcit.groupinfo(
    group_id int auto_increment,
    user_id int,
    date_registration date,
    date_updated date,
    group_name varchar(32),
    PRIMARY KEY (group_id),
    FOREIGN KEY(user_id) REFERENCES userinfo(user_id)
);

create table tmcit.taskinfo(
    task_id int auto_increment,
    user_id int,
    group_id int,
    date_registration date,
    date_limit date,
    task_name varchar(32),
    task_content varchar(144),
    PRIMARY KEY (task_id),
    FOREIGN KEY(user_id) REFERENCES userinfo(user_id),
    FOREIGN KEY(group_id) REFERENCES groupinfo(group_id)
);
