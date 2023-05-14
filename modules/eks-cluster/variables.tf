variable "subnet_ids" {
  type = list
}

variable "vpc_id" {
  type = string
}


variable "cluster_name" {
  type = string
}

variable "kubeconfig_name" {
  type = string

}

variable "config_output_path" {
  description = "Where to save the Kubectl config file (if `write_kubeconfig = true`). Assumed to be a directory if the value ends with a forward slash `/`."
  type        = string
  default     = "./"
}

variable "kubeconfig_aws_authenticator_command" {
  description = "Command to use to fetch AWS EKS credentials."
  type        = string
  default     = "aws-iam-authenticator"
}

variable "node_subnet_ids" {
  type = list
  
}