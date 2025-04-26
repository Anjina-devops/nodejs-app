resource "null_resource" "docker_build_push" {
  provisioner "local-exec" {
    command = <<EOT
      #!/bin/bash
      set -e

      echo "Building Docker Image..."
      docker build -t ${aws_ecr_repository.nodejs_app_repo.repository_url}:latest ./app

      echo "Logging into ECR..."
      aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${aws_ecr_repository.nodejs_app_repo.repository_url}

      echo "Pushing Docker Image to ECR..."
      docker push ${aws_ecr_repository.nodejs_app_repo.repository_url}:latest
    EOT
  }

  depends_on = [aws_ecr_repository.nodejs_app_repo]
}
