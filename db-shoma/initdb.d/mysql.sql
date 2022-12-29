CREATE DATABASE admininfo;
USE admininfo;
CREATE TABLE admininfo (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  user CHAR(100),
  password CHAR(100)
);
