# Todas as variáveis vindas do modulo principal
variable "project_name" {
  type        = string
  description = "Nome do Projeto"
}

variable "tags" {
  type        = map(any)
  description = "Tags pertencentes aos recursos criados"
}

variable "cluster_name" {
  type        = string
  description = "Nome do Cluster"
}

variable "subnet_private_1a" {
  type        = string
  description = "Subnet Privada AZ 1a"
}

variable "subnet_private_1b" {
  type        = string
  description = "Subnet Pública AZ 1b"
}