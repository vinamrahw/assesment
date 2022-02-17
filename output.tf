output "db_url" {
  value = data.mongodbatlas_cluster.db.connection_strings[0].standard
}