resource "aws_instance" "ubuntu" {
  ami                    = var.aws_ami
  count                  = var.instance_count
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_ids[0]
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = merge(var.tags, {
    Name = var.name
  })
}

resource "aws_security_group" "ec2_sg" {
  name        = var.name
  description = "Allow traffic to ec2 instances and all outbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.name
  }
}

resource "aws_security_group_rule" "allow_ssh_inbound" {
  type              = "ingress"
  description       = "Allow SSH inbound traffic"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2_sg.id
}

resource "aws_security_group_rule" "allow_http_inbound" {
  type              = "ingress"
  description       = "Allow HTTP inbound traffic"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2_sg.id
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.ec2_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}