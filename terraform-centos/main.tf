#module "ami-search" {
#  source  = "otassetti/ami-search/aws"
#  os = "centos-7"
#}

#data "aws_ami" "centos" {
#  owners      = ["679593333241"]
#  most_recent = true
#  filter {
#    name   = "name"
#    values = ["CentOS 8 (x86_64)*"]
#  }
#  filter {
#    name   = "architecture"
#    values = ["x86_64"]
#  }
#}

resource "aws_key_pair" "deployer" {
  key_name   = "terraform-lab-centos"
  public_key = var.chave
}

resource "aws_instance" "zeus" {
#    ami = "${data.aws_ami.centos.id}"
    ami = "ami-000e7ce4dd68e7a11"
    instance_type = var.instance_type
    security_groups = ["sg_web_centos"]
    key_name = "terraform-lab-centos"
    tags = {
        Name = var.ec2name
}
}
