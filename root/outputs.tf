output "sns_topic_arn" {
  value = aws_sns_topic.smoke_test.arn
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}
