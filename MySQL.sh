source ./common.

if [ -z "$MY_PASSWORD" ] ;then

echo MY_pASSWORD is needed
exit 1
else
  exit 1
fi

dnf install mysql-server -y

  echo enable mysqld
systemctl enable mysqld
  Status_Print $?

  echo disbale start mysqld
systemctl start mysqld
  Status_Print $?

  echo secure installation
mysql_secure_installation --set-root-pass $MY_PASSWORD
  Status_Print $?
