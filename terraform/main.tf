provider "aws" {
	region = "us-east-1"
	access_key = "AKIA3QICKXBDIG4ED6VZ"
	secret_key = "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"
}
resource "aws_instance" "practise" {
	ami = "ami-083654bd07b5da81d"
	key_name = "aws_key"
	instance_type = "t2.micro"
	tags = {
		Name = "practise"
		}
	vpc_security_group_ids = [aws_security_group.main.id]
}
resource "aws_security_group" "main" {
	ingress = [
		{
		description = ""
		self = false
		protocol = "tcp"
		from_port = 22
		to_port = 22
		ipv6_cidr_blocks = []
		cidr_blocks = [ "0.0.0.0/0", ]
		prefix_list_ids = []
		security_groups = []
		}	
	]
      egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
}