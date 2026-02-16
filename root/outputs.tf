output "sns_topic_arn" {
  value = aws_sns_topic.smoke_test.arn
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "client_sg_id" {
  value = module.security_groups.client_sg_id
}

output "docdb_sg_id" {
  value = module.security_groups.docdb_sg_id
}

output "db_secret_arn" {
  value = module.secrets.secret_arn
}
