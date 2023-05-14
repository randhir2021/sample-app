locals {
kubeconfig_name = var.kubeconfig_name
  kubeconfig = templatefile("${path.module}/templates/kubeconfig.tpl", {
    kubeconfig_name                   = local.kubeconfig_name
    endpoint                          = coalescelist(aws_eks_cluster.example[*].endpoint, [""])[0]
    cluster_auth_base64               = coalescelist(aws_eks_cluster.example[*].certificate_authority[0].data, [""])[0]
    aws_authenticator_command         = var.kubeconfig_aws_authenticator_command
  })
}

resource "local_file" "kubeconfig" {
  content              = local.kubeconfig
  filename             = substr(var.config_output_path, -1, 1) == "/" ? "${var.config_output_path}kubeconfig_${var.cluster_name}" : var.config_output_path
  file_permission      = "0644"
  directory_permission = "0755"
}