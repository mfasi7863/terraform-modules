variable "cluster_name" {
  default = "my-eks-cluster"
}

variable "subnet_ids" {
  type = list(string)
}
