terraform {
  required_version = ">= 1.4.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.50.0"
    }
  }

  cloud {
    hostname     = "app.terraform.io"
    organization = "tebriel"

    workspaces {
      name = "in-frodux-local"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  user_name   = var.openstack_user
  tenant_name = "test"
  password    = var.openstack_pass
  auth_url    = "https://192.168.1.202:5000/v3/"
  insecure    = true
}
