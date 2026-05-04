resource "aws_eks_cluster" "cluster" {
  name     = var.cluster_name
  role_arn = "arn:aws:iam::672296383659:role/EKSRole"

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}
