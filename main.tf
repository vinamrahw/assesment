terraform {
  required_providers {
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
    }
  }
}

provider "mongodbatlas" {
  public_key = "<YOUR PUBLIC KEY HERE>"
  private_key  = "<YOUR PRIVATE KEY HERE>"
}

data "mongodbatlas_cluster" "db" {

  project_id = var.mongodbatlas_project_id
  name       = var.cluster_name
}


resource "random_password" "store-service-password" {
  # Generate a unique new password for the DB user
  #count = 3
  length = 10
  special = true
  min_upper = 1
  min_lower = 1
  min_numeric = 1
}

resource "mongodbatlas_database_user" "dbuser"{
    for_each = {for val in var.service_configuration:  val.serviceName => val}
    username = "${each.value.serviceName}"
    password = random_password.store-srevice-password
    project_id = var.mongodbatlas_project_id
    auth_auth_databse_name = "admin"

    dynamic roles{
        for_each = each.value.mongoCollection[*]
        content {
            role_name = "read"
            database_name = each.value.mongoDatabase
            collection_name = roles.value
        }
    }
}