output "bucket_name" {
  description = "Nom du bucket MinIO utilisé pour le site"
  value       = minio_s3_bucket.web_bucket.bucket
}

output "website_url" {
  description = "URL du site web statique hébergé sur MinIO"
  value       = "http://${var.minio_server}/${var.bucket_name}/index.html"
}

output "minio_console_url" {
  description = "URL de la console MinIO"
  value       = "http://127.0.0.1:9001"
}
