provider "google" {
  project = "qwiklabs-gcp-02-1a443499e474"
  region  = "us-central1"
}

resource "google_sql_database_instance" "cloud-sql" {
  name             = "my-cloud-sql-instance"
  database_version = "MYSQL_5_7"
  region  = "us-central1"
  settings {
    tier = "db-f1-micro"
    
  }
}

resource "google_sql_user" "cloud-sql-user" {
  name     = "myuser"
  password = "mypassword"
  instance = google_sql_database_instance.cloud-sql.name
}

output "connection_name" {
  value = google_sql_database_instance.cloud-sql.connection_name
}
