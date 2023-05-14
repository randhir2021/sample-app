terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "terraform_data" "command" {
  provisioner "local-exec" {
    command = "npm install express && npm fund"
  }
}

# Docker image build
resource "docker_image" "my_image" {
  name         = "my_image"
  build   {
    context    = "${path.cwd}"
        label = {
      author : "zoo"
    }
  }
  depends_on = [terraform_data.command]
}

# resource "terraform_data" "example2" {
#   provisioner "local-exec" {
#     command = "docker login"
#     # interpreter = ["perl", "-e"]
#   }
# }
# # Docker container run
# resource "docker_container" "my_container" {
#   name  = "my_container"
#   image = docker_image.my_image.id
#   ports {
#     internal = 3000
#     external = 3000
#   }
#   restart = "always"
# depends_on = [ terraform_data.example2 ]
# }
