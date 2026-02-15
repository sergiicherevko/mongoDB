resource "aws_sns_topic" "smoke_test" {
  name = "mongo-db-${var.environment_stage}-tf-smoke-test"
}
