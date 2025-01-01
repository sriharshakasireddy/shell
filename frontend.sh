source ./common.sh
Nginx

cp har.conf /etc/nginx/nginx.conf
systemctl enable nginx
systemctl start nginx

rm -rf /usr/share/nginx/html/*

rm -f /tmp/frontend.zip
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip

cd /usr/share/nginx/html
unzip /tmp/frontend.zip




systemctl restart nginx