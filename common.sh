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
if [ USER_ID -ne 0];then
  echo "you should run this script as root userr"
  exit 1
fi
