mysql -u root -e "UPDATE user SET authentication_string=password('ye7ay5tH') WHERE user='root';" mysql
mysql -u root -pye7ay5tH -e "UPDATE user SET plugin='mysql_native_password' WHERE User='root';" mysql
mysql -u root -pye7ay5tH -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'ye7ay5tH';" mysql
mysql -u root -pye7ay5tH -e "FLUSH PRIVILEGES;" mysql

