resource "aws_security_group" "test-nacl-allow-all-out" {
  name = "Allow All Out Sec Group"
  description = "All out/ ssh in traffic is allowed"
  vpc_id = aws_vpc.test-vpc.id

  egress {
    protocol = "-1"
    cidr_blocks = [var.cidr-0]
    from_port = 0
    to_port = 0
  }

  ingress {
    protocol = "tcp"
    cidr_blocks = [var.cidr-0]
    from_port = 22
    to_port = 22
  }

  tags = local.common_tags
}

resource "aws_network_acl" "test-nacl-allow-all" {
  vpc_id = aws_vpc.test-vpc.id

  egress {
    protocol = "-1"
    rule_no = 100
    action = "allow"
    cidr_block = var.cidr-0
    from_port = 0
    to_port = 0
  }

  ingress {
    protocol = "-1"
    rule_no = 200
    action = "allow"
    cidr_block = var.cidr-0
    from_port = 0
    to_port = 0
  }

   tags = local.common_tags
}

resource "aws_key_pair" "test-kp"{
  key_name = "test key name"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDNqkWp5ahySQnRosKoWSVjwfCmmvFecHeZZt0erUL14qNQcPvipiQQPzU12AdD53HQb5pvhA2zqh5ihxM9yUXVo+2uNF59XDbLfAtdyKW7LDFzAjSAdxA0gjvSOXBCQbbY4DcqN80YIaudm8Z3QADXsqDThdwD+6ijvcWaaN1VDGIz8Di84FOxWK88Hp/6Nq/q/M1pEp6FrSjuM8OpAoqedOsUnFmVsPgnUBEQdG1Y5SvHliw669ndvp5CBk7GgB+SA1kB9ZSPOZwRqavKpS0VfQPgNBBUIz+sAiyDLAYXYkCV+Ho/j46dp3R7F4SoGGGY73h2899UhHroTuQ9gMrplVMFmaVlEX+sjySJ60+JXdQDOu9QQMn77HzZhSgk/62pPhnJoojForG4miC3dYIuoKjKuxGG0jf0xjaWTMj9KpVhfG8Aa2bhh8vMgaSrNm+RjRObQHacRmJ+7qhQLpTypyYpMRM7MWc6Th53UrFwRP7u+x6I0NkWOY9+XVoRwVM="
}

