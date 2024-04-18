terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "ngix" {
  name = "ngix"
  keep_locally = false
}

resource "docker_container" "ngix" {
  image = docker_image.ngix.image.id
  name = "testing-nginx"

  ports {
    internal = 80
    extrnal = 8080
  }
}