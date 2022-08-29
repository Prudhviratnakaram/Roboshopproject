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
  if [ $? -eq 0 ];then
    echo SUCCESS
   else
     echo FAILURE
   fi
 unzip /tmp/cart.zip &>>/tmp/cart.log
  if [ $? -eq 0 ];then
    echo SUCCESS
   else
     echo FAILURE
   fi
 mv cart-main cart &>>/tmp/cart.log
 if [ $? -eq 0 ];then
     echo SUCCESS
    else
      echo FAILURE
    fi

 cd cart &>>/tmp/cart.log
 if [ $? -eq 0 ];then
     echo SUCCESS
    else
      echo FAILURE
    fi
 npm install &>>/tmp/cart.log
 if [ $? -eq 0 ];then
     echo SUCCESS
    else
      echo FAILURE
    fi
 mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service &>>/tmp/cart.log
 if [ $? -eq 0 ];then
     echo SUCCESS
    else
      echo FAILURE
    fi
 systemctl daemon-reload &>>/tmp/cart.log
 systemctl start cart &>>/tmp/cart.log
 systemctl enable cart  systemctl enable cart
 if [ $? -eq 0 ];then
     echo SUCCESS
    else
      echo FAILURE
    fi