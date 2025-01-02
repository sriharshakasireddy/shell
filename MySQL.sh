dnf install mysql-server -

  echo enable mysqld
systemctl enable mysqld
  Status_Print $?

  echo disbale start mysqld
systemctl start mysqld
  Status_Print $?

  echo secure installation
mysql_secure_installation --set-root-pass RoboShop@1
  Status_Print $?
