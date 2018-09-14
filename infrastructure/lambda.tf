data "archive_file" "index" {
  type = "zip"
  source_file = "../src/index.js"
  output_path = "../build/index.zip"
}

resource "aws_lambda_function" "graphql" {
  function_name = "${var.lambda_function}-${terraform.workspace}"
  description = "GraphQL endpoint for Vurvey in the ${terraform.workspace} environment"
  filename = "${data.archive_file.index.output_path}"
  source_code_hash = "${base64sha256(file(data.archive_file.index.output_path))}"

  # "index" is the filename within the zip file (index.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "index.handler"
  runtime = "nodejs8.10"
  # role is retrieved from role_lambda file
  role = "${aws_iam_role.lambda_exec.arn}"

  environment {
    variables = {
      NODE_ENV = "${terraform.workspace}"
    }
  }
}

resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.graphql.arn}"
  principal     = "apigateway.amazonaws.com"

  # The /*/* portion grants access from any method on any resource
  # within the API Gateway "REST API".
  source_arn = "${aws_api_gateway_deployment.graphql.execution_arn}/*/*"
}
