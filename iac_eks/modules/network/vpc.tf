resource "aws_vpc" "eks_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  # Função para adição de tags especificadas para Todos os recursos com as Tags específicas para cada recurso
  tags = merge(
    # Variáveis de identificação do Projeto na VPC (Todos os recursos)
    var.tags,
    {
      # Variavel específica do recurso, como Nome 
      Name = "${var.project_name}-vpc"
    }
  )
}