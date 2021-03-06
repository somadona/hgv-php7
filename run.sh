#!/bin/bash         

echo "Installing Updates and Software"

echo "- apt-get install software-properties-common python-software-properties"
sudo apt-get install software-properties-common python-software-properties -y

echo "- add-apt-repository ppa:ondrej/php-7.0 && sudo add-apt-repository ppa:ansible/ansible"
yes '' | sudo add-apt-repository ppa:ondrej/php-7.0 && yes '' | sudo add-apt-repository ppa:ansible/ansible

echo "- apt-get update && sudo apt-get upgrade"
sudo apt-get update && sudo apt-get upgrade -y

echo "- apt-get install ansible git"
sudo apt-get install ansible git -y

git clone https://github.com/jknlsn/hgv-php7/

cd hgv-php7

nano host_vars/website

time sudo ansible-playbook -i hosts playbook.yml -c local

echo "First stage is done. If the playbook completed with no errors, then type the command"
echo "./hgv-php7/finish.sh"
echo "Else if there were any errors, then type the command"
echo "./hgv-php7/retry.sh"
