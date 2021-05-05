#NAME:              run.sh
#VERSION:           1.3
#DESCRIPTION:       Cria uma stack automatizada IaC(Terraform+Ansible)
#DATE OF CREATION:  17/01/2021
#DEVELOPED BY:      Emerson Araujo da Silva
#E-MAIL:            araujo.emerson28@gmail.com
#LICENSE:           GPLv3

WORK_DIRECTORY=/home/gerson/lab-terraform/

echo "Welcome to IaC Adventure"

while : ; do

echo "[ 1 ] Create EC2 Ubuntu-20 on AWS"

echo "[ 2 ] Delete EC2 Ubuntu-20"

echo "[ 3 ] Install Wordpress by Ansible"

echo "[ 4 ] Exit"

read op

case $op in

  1)

echo "TERRAFORM INIT"
cd $WORK_DIRECTORY/terraform-ubuntu/ ; terraform init
echo "TERRAFORM VALIDATE"
echo ""
terraform validate
echo "CREATING AWS INFRA"
echo ""
terraform apply -auto-approve 

;;

  2)
echo "DELETING INFRA ON AWS"
echo ""
cd $WORK_DIRECTORY/terraform-ubuntu ; terraform destroy -auto-approve 

;;

  3)
echo "INSTALLING AND CONFIGURING WORDPRESS"
echo ""
cd $WORK_DIRECTORY/ansible-ubuntu ; ansible-playbook wordpress_main.yml -i ../terraform-ubuntu/inventory

;;

  4)
echo "Bye"
exit 

;;

*)echo "Usage: {1|2|3|4}"
esac
done
