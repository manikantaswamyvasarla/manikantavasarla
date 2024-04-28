
provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "Terraform_server-class-1" {
  ami           = "ami-080e1f13689e07408"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-test-name"
  }
}
resource "aws_s3_bucket" "terraform-test" {
   bucket = "spacelift-s3"

  tags = {
    Name = "terraform-test"
  }
}
resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = "arn:aws:sns:us-west-2:432981146916:user-updates-topic"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-west-2:432981146916:terraform-queue-too"
}