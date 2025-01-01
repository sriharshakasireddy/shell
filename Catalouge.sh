



source ./common.sh
app_name=catalouge

NODEJS


cp $dir_path/mongo.repo /etc/yum.repos.d/mongo.repo
dnf install mongodb-mongosh -y
mongosh --host 10.0.0.6 </app/db/master-data.js