dir_path=$(pwd)
Nginx()
{
  dnf module disable nginx -y
dnf module enable nginx:1.24 -y
dnf install nginx -y

}

NODEJS()
{
  dnf module disable nodejs -y
  dnf module enable nodejs:20 -y
  dnf install nodejs -y

 
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
dnf install maven -y

 PreReq
 mvn clean package
 mv target/$app_name-1.0.jar $app_name.jar
 
System_setUp
 }
 
 Python()
 {
  dnf install python3 gcc python3-devel -y
  PreReq
  pip3 install -r requirements.txt
  
  
System_setUp
  }

Dispatching()
{

 dnf install golang -y
 
PreReq
go mod init $app_name
go get
go build

System_setUp
}