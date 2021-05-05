#NAME:              automating.sh
#VERSION:           1.0
#DESCRIPTION:       Cria uma stack automatizada IaC(Terraform+Ansible)
#DATE OF CREATION:  17/01/2021
#DEVELOPED BY:      Gerson Anjos
#E-MAIL:            gerson_med@hotmail.com
#LICENSE:           GPLv3

WORK_DIRECTORY=/home/gerson/lab-terraform/

echo "Welcome to IaC Adventure"

while : ; do

echo "[ 1 ] Create EC2 Centos8 on AWS"

echo "[ 2 ] Delete EC2 Centos8"

echo "[ 3 ] Install Wordpress by Ansible on Centos8"

echo "[ 4 ] Create EC2 Ubuntu20 on AWS"

echo "[ 5 ] Delete EC2 Ubuntu20"

echo "[ 6 ] Install Wordpress by Ansible on Ubuntu20"

echo "[ 7 ] Exit"

read op

case $op in

  1)

echo "TERRAFORM INIT"
cd $WORK_DIRECTORY/terraform-centos/ ; terraform init
echo "TERRAFORM VALIDATE"
echo ""
terraform validate
echo "CREATING AWS INFRA CENTOS8"
echo ""
terraform apply -auto-approve

;;

  2)
echo "DELETING INFRA CENTOS8 ON AWS"
echo ""
cd $WORK_DIRECTORY/terraform-centos/ ; terraform destroy -auto-approve

;;

  3)
echo "INSTALLING AND CONFIGURING WORDPRESS ON CENTOS8"
echo ""
cd $WORK_DIRECTORY/ansible-centos/ ; ansible-playbook wordpress_main.yml -i ../terraform-centos/inventory

;;

  4)

echo "TERRAFORM INIT"
cd $WORK_DIRECTORY/terraform-ubuntu/ ; terraform init
echo "TERRAFORM VALIDATE"
echo ""
terraform validate
echo "CREATING AWS INFRA UBUNTU20"
echo ""
terraform apply -auto-approve

;;

  5)
echo "DELETING INFRA UBUNTU20 ON AWS"
echo ""
cd $WORK_DIRECTORY/terraform-ubuntu ; terraform destroy -auto-approve

;;

  6)
echo "INSTALLING AND CONFIGURING WORDPRESS ON UBUNTU20"
echo ""
cd $WORK_DIRECTORY/ansible-ubuntu ; ansible-playbook wordpress_main.yml -i ../terraform-ubuntu/inventory

;;

  7)
echo "Bye"
exit

;;

*)echo "Usage: {1|2|3|4|5|6|7}"
esac
done
