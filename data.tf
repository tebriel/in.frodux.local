data "openstack_compute_flavor_v2" "tiny" {
  vcpus = 1
  ram   = 512
}

data "openstack_compute_flavor_v2" "small" {
  vcpus = 1
  ram   = 2048
}

data "openstack_networking_network_v2" "external" {
  name = "external"
}
