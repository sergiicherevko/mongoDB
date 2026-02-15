resource "aws_security_group" "client" {
  name        = "${var.name}-client-sg"
  description = "Client/app SG that is allowed to talk to DocumentDB"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.name}-client-sg"
  }
}

resource "aws_security_group" "docdb" {
  name        = "${var.name}-docdb-sg"
  description = "DocumentDB SG allowing MongoDB traffic only from client SG"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.name}-docdb-sg"
  }
}

# Allow inbound MongoDB traffic ONLY from client SG
resource "aws_vpc_security_group_ingress_rule" "docdb_from_client_27017" {
  security_group_id            = aws_security_group.docdb.id
  referenced_security_group_id = aws_security_group.client.id
  ip_protocol                  = "tcp"
  from_port                    = 27017
  to_port                      = 27017
  description                  = "Allow MongoDB from client SG"
}

# Allow all egress from both SGs (typical default; can tighten later)
resource "aws_vpc_security_group_egress_rule" "client_all" {
  security_group_id = aws_security_group.client.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
  description       = "Allow all outbound"
}

resource "aws_vpc_security_group_egress_rule" "docdb_all" {
  security_group_id = aws_security_group.docdb.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
  description       = "Allow all outbound"
}
