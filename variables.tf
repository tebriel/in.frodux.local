variable "openstack_user" {
  type        = string
  description = "The user to authenticate to openstack"
}

variable "openstack_pass" {
  type        = string
  description = "The password to authenticate to openstack"
  sensitive   = true
}

variable "public_ssh_key" {
  type        = string
  description = "The public ssh key to use for provisioning"
}
