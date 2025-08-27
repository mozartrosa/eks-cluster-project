resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.project_name}-cluster"
  # Amazon Resource Name
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = [
      var.public_subnet_1a,
      var.public_subnet_1b
    ]
    # Acesso ao endpoint da API do Kubernetes via rede privada
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  # Forçando uma dependência
  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_role_attachment
  ]

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-cluster"
    }
  )
}

# Criação do Namespace para aplicações
resource "kubernetes_namespace" "app" {
  metadata {
    name = "app"
  }
}
