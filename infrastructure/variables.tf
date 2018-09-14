variable "aws_access_key" {
  description = "AWS access key"
  default     = "AKIAI6SJUWFUHY46YUJQ"
}
variable "aws_secret_key" {
  description = "AWS secret key"
  default     = "kY30PECi7VyBR2giYlZa8RX0nOlAeANbOJunprXK"
}
variable "aws_region" {
  description = "AWS region"
  default     = "us-west-2"
}
variable "lambda_function" {
  description = "Name of lambda function"
  default     = "vurv_graphql"
}
variable "env" {
  default = ""
}
