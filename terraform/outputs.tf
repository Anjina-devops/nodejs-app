output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

/* output "kubeconfig" {
  description = "Kubeconfig output"
  value       = module.eks.kubeconfig
} */
