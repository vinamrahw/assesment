variable "mongodbatlas_project_id" {
  default = "SampleProjeect"
}

variable "environment" {
  default = "dev"
}

variable "cluster_name" {
  default = "animals-mongo"
}

variable "service_configuration" {
  default = [
  {
    "serviceName": "possums-data-store",
    "mongoCluster": "animals-mongo",
    "mongoDatabase": "marsupials-dev",
    "mongoCollection": ["possums"]
  },
  {
    "serviceName": "numbats-data-store",
    "mongoCluster": "animals-mongo",
    "mongoDatabase": "marsupials-dev",
    "mongoCollection": ["numbats"]
  },
  {
    "serviceName": "marsupial-data-store",
    "mongoCluster": "animals-mongo",
    "mongoDatabase": "marsupials-prod",
    "mongoCollection": ["numbats", "possums"]
  }
]
}

