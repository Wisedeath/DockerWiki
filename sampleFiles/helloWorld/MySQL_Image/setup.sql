USE mysql;
update user set password=PASSWORD("Test12345") where User='root';
FLUSH PRIVILEGES;
CREATE DATABASE test_db;
GRANT ALL PRIVILEGES ON test_db.* TO 'test_user'@'%' IDENTIFIED BY 'graph_db_pw';
GRANT ALL PRIVILEGES ON test_db.* TO 'test_user'@'localhost' IDENTIFIED BY 'graph_db_pw';
FLUSH PRIVILEGES;
