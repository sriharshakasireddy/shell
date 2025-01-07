dir_path=$(pwd)
log_file=/tmp/roboshop.log
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
 Status_Print
  echo enabale nodejs
  dnf module enable nodejs:20 -y >$log_file
 echo $?
  echo Install nodejs
  dnf install nodejs -y >$log_file
  Status_Print $?

 
     PreReq
     npmi
     System_setUp
 
 }
 
  PreReq()
  {
     echo useradd roboshop
  useradd roboshop >$log_file

  rm -r /app >$log_file

  echo create /app directory
  mkdir /app >$log_file

  rm -f /tmp/$app_name.zip >$log_file

  curl -L -o /tmp/$app_name.zip https://roboshop-artifacts.s3.amazonaws.com/$app_name-v3.zip >$log_file
  cd /app >$log_file

  echo unzip file
  unzip /tmp/$app_name.zip >$log_file
  cd /app >$log_file
  
  }
  
  npmi()
  {
    echo install npm
    npm install >$log_file
  }
 
 System_setUp ()
 {
     cp $dir_path/$app_name.service /etc/systemd/system/$app_name.service >$log_file
 systemctl daemon-reload >$log_file
 systemctl enable $app_name >$log_file
 systemctl start $app_name >$log_file
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

mysql -h 10.0.0.10 -uroot -pRoboShop@1 < /app/db/$file.sql
done
systemctl restart shipping
}

Status_Print()
{
  if  [ $? -gt 0 ] ; then
    echo -e "\e[38;5;214mFAILURE\e[0m"
    else
echo -e "\e[38;5;214mSUCCESS\e[0m"
fi
}