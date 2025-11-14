variable "minio_server" {
  type        = string
  description = "Adresse du serveur MinIO (host:port)"
}

variable "minio_user" {
  type        = string
  description = "Utilisateur MinIO"
}

variable "minio_password" {
  type        = string
  description = "Mot de passe MinIO"
  sensitive   = true
}

variable "bucket_name" {
  type        = string
  description = "Nom du bucket pour le site web"
  default     = "webbucket"
}
