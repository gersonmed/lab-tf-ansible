data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "deployer" {
  key_name   = "terraform-lab-ubuntu"
  public_key = var.chave
}

resource "aws_instance" "zeus" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    security_groups = ["sg_web_ubuntu"]
    key_name = "terraform-lab-ubuntu"
    tags = {
        Name = var.ec2name
}
}
