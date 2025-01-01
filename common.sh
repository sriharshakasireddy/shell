dir_path=$(pwd)
log_file= /tmp/roboshop.log
Nginx()
{
  echo disbale nginx
dnf module disable nginx -y

  echo enabale nginx
dnf module enable nginx:1.24 -y

  echo install nginx
dnf install nginx -y

}

NODEJS()
{

    echo disbale nodejs
  dnf module disable nodejs -y >$log_file

  echo enabale nodejs
  dnf module enable nodejs:20 -y >$log_file

  echo Install nodejs
  dnf install nodejs -y >$log_file

 
     PreReq
     npmi
     System_setUp
 
 }
 
  PreReq()
  { 
  useradd roboshop

  rm -r /app
  mkdir /app

  rm -f /tmp/$app_name.zip

  curl -L -o /tmp/$app_name.zip https://roboshop-artifacts.s3.amazonaws.com/$app_name-v3.zip
  cd /app
  unzip /tmp/$app_name.zip
  cd /app
  
  }
  
  npmi()
  {
    echo install npm
    npm install
  }
 
 System_setUp ()
 {
     cp $dir_path/$app_name.service /etc/systemd/system/$app_name.service
 systemctl daemon-reload
 systemctl enable $app_name
 systemctl start $app_name
}

Java()
{

  echo install maven
dnf install maven -y

 PreReq
 mvn clean package
 mv target/$app_name-1.0.jar $app_name.jar
 
System_setUp
 }
 
 Python()
 {

   echo install python3
  dnf install python3 gcc python3-devel -y

  PreReq
  pip3 install -r requirements.txt
  
  
System_setUp
  }

Dispatching()
{
echo install golang
 dnf install golang -y
 
PreReq
go mod init $app_name
go get
go build

System_setUp
}

password(){

  for file in schema app-user master-data; do

mysql -h 10.0.0.9 -uroot -pRoboShop@1 < /app/db/$file.sql
done
systemctl restart shipping
}