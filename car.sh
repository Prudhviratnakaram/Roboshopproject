 curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/cart.log
 if [ $? -eq 0 ];then
   echo SUCCESS
  else
    echo FAILURE
  fi
 yum install nodejs -y &>>/tmp/cart.log
  if [ $? -eq 0 ];then
    echo SUCCESS
   else
     echo FAILURE
   fi
 useradd roboshop &>>/tmp/cart.log
  if [ $? -eq 0 ];then
    echo SUCCESS
   else
     echo FAILURE
   fi
 curl -s -L -o /tmp/cart.zip "https://github.com/roboshop-devops-project/cart/archive/main.zip" &>>/tmp/cart.log
  if [ $? -eq 0 ];then
    echo SUCCESS
   else
     echo FAILURE
   fi
 cd /home/roboshop &>>/tmp/cart.log
 unzip /tmp/cart.zip &>>/tmp/cart.log
 mv cart-main cart &>>/tmp/cart.log
 cd cart &>>/tmp/cart.log
 npm install &>>/tmp/cart.log
 mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service &>>/tmp/cart.log
 systemctl daemon-reload &>>/tmp/cart.log
 systemctl start cart &>>/tmp/cart.log
 systemctl enable cart  systemctl enable cart