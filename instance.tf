resource "aws_instance" "test-t2" {
  ami = data.aws_ami.test-ami.id
  instance_type = var.instance-type
  key_name = aws_key_pair.test-kp.key_name
  vpc_security_group_ids = [aws_security_group.test-nacl-allow-all-out.id]
  subnet_id = aws_subnet.test-subnet.id
  availability_zone = "${var.region}a"

  tags = local.common_tags
}
