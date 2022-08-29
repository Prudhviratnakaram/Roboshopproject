 curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/cart.log
 if [ $? -eq 0 ];then
   echo SUCCESS
  else
    echo FAILURE
    exit
  fi
 yum install nodejs -y &>>/tmp/cart.log
  if [ $? -eq 0 ];then
    echo SUCCESS
   else
     echo FAILURE
     exit
   fi
 useradd roboshop &>>/tmp/cart.log
  if [ $? -eq 0 ];then
    echo SUCCESS
   else
     echo FAILURE
     exit
   fi
 curl -s -L -o /tmp/cart.zip "https://github.com/roboshop-devops-project/cart/archive/main.zip" &>>/tmp/cart.log
  if [ $? -eq 0 ];then
    echo SUCCESS
   else
     echo FAILURE
     exit
   fi
 cd /home/roboshop &>>/tmp/cart.log
  if [ $? -eq 0 ];then
    echo SUCCESS
   else
     echo FAILURE
     exit
   fi
 unzip /tmp/cart.zip &>>/tmp/cart.log
  if [ $? -eq 0 ];then
    echo SUCCESS
   else
     echo FAILURE
     exit
   fi
 mv cart-main cart &>>/tmp/cart.log
 if [ $? -eq 0 ];then
     echo SUCCESS
    else
      echo FAILURE
      exit
    fi

 cd cart &>>/tmp/cart.log
 if [ $? -eq 0 ];then
     echo SUCCESS
    else
      echo FAILURE
      exit
    fi
 npm install &>>/tmp/cart.log
 if [ $? -eq 0 ];then
     echo SUCCESS
    else
      echo FAILURE
      exit
    fi
 mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service &>>/tmp/cart.log
 if [ $? -eq 0 ];then
     echo SUCCESS
    else
      echo FAILURE
      exit
    fi
 systemctl daemon-reload &>>/tmp/cart.log
 systemctl start cart &>>/tmp/cart.log
 systemctl enable cart  systemctl enable cart &>>/tmp/cart.log
 if [ $? -eq 0 ];then
     echo SUCCESS
    else
      echo FAILURE
      exit
    fi
