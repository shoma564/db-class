create database tmcit;
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

create table tmcit.physicalinfo(
    user_id int auto_increment,
    user_height int,
    user_weight int,
    user_age int,
    date_registration date,
    date_updated date,
    FOREIGN KEY(user_id) REFERENCES userinfo(user_id)
    );

create table tmcit.calorieinfo(
    user_id int auto_increment,
    caloric_intake int,
    date_updated date,
    FOREIGN KEY(user_id) REFERENCES userinfo(user_id)
    );

create table tmcit.sleepinginfo(
    user_id int auto_increment,
    sleeping_hours int,
    date_updated date,
    FOREIGN KEY(user_id) REFERENCES userinfo(user_id)
    );

create table tmcit.fluidinfo(
    user_id int auto_increment,
    fluid_intake int,
    date_updated date,
    FOREIGN KEY(user_id) REFERENCES userinfo(user_id)
    );


create table tmcit.execiseinfo(
    user_id int auto_increment,
    execise_time int,
    execise_id varchar(5),
    date_updated date,
    PRIMARY KEY (execise_id),
    FOREIGN KEY(user_id) REFERENCES userinfo(user_id)
    );

create table tmcit.eventinfo(
    execise_id varchar(5),
    execise_event int,
    date_updated date,
    FOREIGN KEY(execise_id) REFERENCES execiseinfo(execise_id)
    );

