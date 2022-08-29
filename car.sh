
 curl -sL https://rpm.nodesource.com/setup_lts.x | bash >>/tmp/car.log
 echo $?
 yum install nodejs -y >>/tmp/car.log
 echo $?
 useradd roboshop >>/tmp/car.log
 echo $?
 curl -s -L -o /tmp/cart.zip "https://github.com/roboshop-devops-project/cart/archive/main.zip"  >>/tmp/car.log
 echo $?
 cd /home/roboshop >>/tmp/car.log
 echo $?
 unzip /tmp/cart.zip >>/tmp/car.log
 echo $?
 mv cart-main cart >>/tmp/car.log
 echo $?
 cd cart >>/tmp/car.log
 echo $?
 npm install >>/tmp/car.log
 echo $?
 mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service >>/tmp/car.log
 echo $?
 systemctl daemon-reload >>/tmp/car.log
 echo $?
 systemctl start cart >>/tmp/car.log
 echo $?
 systemctl enable cart >>/tmp/car.log
 echo $?