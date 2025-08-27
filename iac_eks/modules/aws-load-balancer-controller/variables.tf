variable "project_name" {
  type        = string
  description = "Nome do Projeto"
}

variable "tags" {
  type        = map(any)
  description = "Tags pertencentes aos recursos criados"
}

variable "oidc" {
  type        = string
  description = "Autenticação OIDC do Cluster"
}

variable "cluster_name" {
  type        = string
  description = "Nome do Cluster"
}

variable "vpc_id" {
  type        = string
  description = "Id da VPC"
}