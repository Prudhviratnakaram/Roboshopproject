StatusCheck()
{
  if [ $? -eq 0 ];then
    echo "SUCCESS"
  else
    echo "FAILURE"
    exit 1
  fi
}
Nodejs()
{
  echo "Configuraing nodejs reps"
   curl -sL https://rpm.nodesource.com/setup_lts.x | bash
   StatusCheck
  echo "installing nodeja"
   yum install nodejs -y

   useradd roboshop
}
USER_ID=$(id -u)
# shellcheck disable=SC2170
if [ USER_ID -ne 0 ]; then
  echo "you should run this script as root user"
  exit 1
fi

Download()
{
  echo "Downloading the ${component} Application content "
  curl -s -L -o /tmp/${component} .zip "https://github.com/roboshop-devops-project/${component} /archive/main.zip" &>>/tmp/${component}.log
  StatusCheck
}
log=/tmp/${component}.log
rm -f${log}
Java()
{
   yum install maven -y &>>{log}
   StatusCheck
   cd /home/roboshop
   rm -rf shipping
   curl -s -L -o /tmp/shipping.zip "https://github.com/roboshop-devops-project/shipping/archive/main.zip" &>>{log}
   StatusCheck
   unzip -o /tmp/shipping.zip
   mv shipping-main shipping
   cd shipping
   mvn clean package && mv target/shipping-1.0.jar shipping.jar && mv /home/roboshop/shipping/systemd.service /etc/systemd/system/shipping.service &>>{log}
   StatusCheck
   systemctl daemon-reload && systemctl start shipping && systemctl enable shipping
}

user= roboshop123