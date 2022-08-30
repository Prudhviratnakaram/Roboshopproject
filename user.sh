  source common.sh
  component= user
  Nodejs
  Download
  cd /home/roboshop
  rm -rf user
  unzip -o /tmp/user.zip
  mv user-main user
  cd /home/roboshop/user
  echo "installing the npm packages"
  npm install
  mv /home/roboshop/user/systemd.service /etc/systemd/system/user.service

  systemctl daemon-reload &&  systemctl start user &&  systemctl enable user
