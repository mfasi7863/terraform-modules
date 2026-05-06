variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "All subnets for EKS cluster control plane (public + private, must be in different AZs)"
  type        = list(string)
}

variable "node_subnet_ids" {
  description = "Subnets for EKS node group (private subnets with NAT Gateway access)"
  type        = list(string)
}

variable "cluster_tags" {
  description = "Tags to apply to the EKS cluster"
  type        = map(string)
  default     = {}
}
