variable "aws_region" {
  default = "us-east-1"
}

variable "ami" {
  default = {
    us-east-1 = "ami-sdf786"
  }
}
 
variable "aws_keypair" {
  default = "default-ssh"
}

variable "web" {
  default = "sg-fwe4444"
}

variable "outbound" {
  default = "sg-3sw334d"
}

variable "support" {
  default = "sg-5678dsa"
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "awslxweb01" {
  ami = "${lookup(var.ami, var.aws_region)}"
  instance_type = "t1.micro"
  key_name = "${var.aws_keypair}"
  availability_zone = "us-east-1b"
  security_groups = ["${var.web}","${var.outbound}","${var.support}"]
  subnet_id = "subnet-dghr4345"
  iam_instance_profile = "default-iam"
  user_data = "awslxweb01"
  tags {
    Name = "awslxweb01"
    Purpose = "web"
    Role = "wsgi"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.awslxweb01.private_ip} > hosts_file"
  }
}
