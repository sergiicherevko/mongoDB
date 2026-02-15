output "client_sg_id" {
  value = aws_security_group.client.id
}

output "docdb_sg_id" {
  value = aws_security_group.docdb.id
}
