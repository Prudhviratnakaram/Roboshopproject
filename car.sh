
 curl -sL https://rpm.nodesource.com/setup_lts.x | bash >>/tmp/car.log
 rm -rf
 if [ $? -eq 0 ];then
   echo -e "\e[32SUCCESS\e[0m"
 else
   echo -e "\e[31SUCCESS\e[0m"
  fi
 yum install nodejs -y >>/tmp/car.log
 if [ $? -eq 0 ];then
   echo -e "\e[32SUCCESS\e[0m"
 else
   echo -e "\e[31SUCCESS\e[0m"
  fi
 useradd roboshop >>/tmp/car.log
 if [ $? -eq 0 ];then
   echo -e "\e[32SUCCESS\e[0m"
 else
   echo -e "\e[31SUCCESS\e[0m"
  fi
 curl -s -L -o /tmp/cart.zip "https://github.com/roboshop-devops-project/cart/archive/main.zip"  >>/tmp/car.log
 if [ $? -eq 0 ];then
   echo -e "\e[32SUCCESS\e[0m"
 else
   echo -e "\e[31SUCCESS\e[0m"
  fi
 cd /home/roboshop >>/tmp/car.log
 if [ $? -eq 0 ];then
   echo -e "\e[32SUCCESS\e[0m"
 else
   echo -e "\e[31SUCCESS\e[0m"
  fi
 unzip /tmp/cart.zip >>/tmp/car.log
 if [ $? -eq 0 ];then
   echo -e "\e[32SUCCESS\e[0m"
 else
   echo -e "\e[31SUCCESS\e[0m"
  fi
 mv cart-main cart >>/tmp/car.log
 if [ $? -eq 0 ];then
   echo -e "\e[32SUCCESS\e[0m"
 else
   echo -e "\e[31SUCCESS\e[0m"
  fi
 cd cart >>/tmp/car.log
 if [ $? -eq 0 ];then
   echo -e "\e[32SUCCESS\e[0m"
 else
   echo -e "\e[31SUCCESS\e[0m"
  fi
 npm install >>/tmp/car.log
 if [ $? -eq 0 ];then
   echo -e "\e[32SUCCESS\e[0m"
 else
   echo -e "\e[31SUCCESS\e[0m"
  fi
 mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service >>/tmp/car.log
 if [ $? -eq 0 ];then
   echo -e "\e[32SUCCESS\e[0m"
 else
   echo -e "\e[31SUCCESS\e[0m"
  fi
 systemctl daemon-reload >>/tmp/car.log
 if [ $? -eq 0 ];then
   echo -e "\e[32SUCCESS\e[0m"
 else
   echo -e "\e[31SUCCESS\e[0m"
  fi
 systemctl start cart >>/tmp/car.log
 if [ $? -eq 0 ];then
   echo -e "\e[32SUCCESS\e[0m"
 else
   echo -e "\e[31SUCCESS\e[0m"
  fi
 systemctl enable cart >>/tmp/car.log
 if [ $? -eq 0 ];then
   echo -e "\e[32SUCCESS\e[0m"
 else
   echo -e "\e[31SUCCESS\e[0m"
  fi