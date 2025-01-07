



source ./common.sh
app_name=catalogue

NODEJS


cp $dir_path/mongo.repo /etc/yum.repos.d/mongo.repo >$log_file
dnf install mongodb-mongosh -y >$log_file
mongosh --host 10.0.0.8 </app/db/master-data.js >$log_file