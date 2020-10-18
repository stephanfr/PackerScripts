#!/bin/bash -eu

apt-get install -y whois

useradd -m -s /bin/bash -p $(mkpasswd --hash=SHA-512 ${DEV_PASSWORD}) ${DEV_USERNAME}
usermod -aG sudo ${DEV_USERNAME}

groupadd docker
usermod -aG docker ${DEV_USERNAME}

mkdir /home/${DEV_USERNAME}/.ssh
cp /tmp/uploads/rsa.pub /home/${DEV_USERNAME}/.ssh/authorized_keys
chmod -R go= /home/${DEV_USERNAME}/.ssh
chown -R ${DEV_USERNAME}:${DEV_USERNAME} /home/${DEV_USERNAME}/.ssh


history -c


