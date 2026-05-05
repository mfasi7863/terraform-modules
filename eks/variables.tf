variable "cluster_name" {
  description = "my-eks-cluster"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets for EKS (must be in different AZs)"
  type        = list(string)
}
