cp catalogue.service /etc/systemd/system/catalogue.service

cp mongo.repo /etc/yum.repos.d/mongo.repo

source ./common.sh
app_name=catalouge

NODEJS



dnf install mongodb-mongosh -y
mongosh --host 10.0.0.6 </app/db/master-data.js