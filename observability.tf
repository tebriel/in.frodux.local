# https://cloud-images.ubuntu.com/kinetic/current/kinetic-server-cloudimg-amd64.img
resource "openstack_images_image_v2" "ubuntu-kinetic" {
  name             = "ubuntu-kinetic"
  image_source_url = "https://cloud-images.ubuntu.com/kinetic/current/kinetic-server-cloudimg-amd64.img"
  container_format = "bare"
  disk_format      = "qcow2"

  properties = {
    version    = "current"
    os         = "ubuntu"
    os_version = "22.10"
  }
}

resource "openstack_compute_keypair_v2" "tebriel-personal" {
  name       = "tebriel-personal"
  public_key = var.public_ssh_key
}

resource "openstack_compute_instance_v2" "observability" {
  name            = "observability"
  image_id        = openstack_images_image_v2.ubuntu-kinetic.id
  flavor_id       = data.openstack_compute_flavor_v2.small.id
  key_pair        = openstack_compute_keypair_v2.tebriel-personal.name
  security_groups = ["default"]

  network {
    uuid = data.openstack_networking_network_v2.external.id
  }
}
