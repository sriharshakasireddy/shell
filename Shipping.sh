source ./common.sh
app_name=shipping

Java

dnf install mysql -y
mysql -h 10.0.0.9 -uroot -pRoboShop@1 < /app/db/schema.sql
mysql -h 10.0.0.9 -uroot -pRoboShop@1 < /app/db/app-user.sql
mysql -h 10.0.0.9 -uroot -pRoboShop@1 < /app/db/master-data.sql
systemctl restart shipping
