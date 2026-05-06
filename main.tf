terraform {
  required_version = ">= 1.0"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "~> 0.7.0"
    }
  }
}

provider "libvirt" {
  uri = "qemu+ssh://${var.kvm_user}@${var.kvm_host}/system"
}

# Ubuntu 22.04 base image
resource "libvirt_image" "ubuntu" {
  name   = "ubuntu-22.04-base"
  source = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
}

# Master VM
resource "libvirt_domain" "k3s_master" {
  name   = "k3s-master"
  memory = 4096  # 4GB in MB
  vcpu   = 2

  disk {
    volume_id = libvirt_volume.master_disk.id
  }

  network_interface {
    network_name = "default"
  }

  console {
    type        = "pty"
    target_port = 0
  }

  depends_on = [libvirt_volume.master_disk]
}

# Master disk
resource "libvirt_volume" "master_disk" {
  name           = "k3s-master.qcow2"
  base_volume_id = libvirt_image.ubuntu.id
  size           = 20 * 1024 * 1024 * 1024  # 20GB in bytes
}

# Worker VM 1
resource "libvirt_domain" "k3s_worker1" {
  name   = "k3s-worker-1"
  memory = 2048  # 2GB in MB
  vcpu   = 2

  disk {
    volume_id = libvirt_volume.worker1_disk.id
  }

  network_interface {
    network_name = "default"
  }

  console {
    type        = "pty"
    target_port = 0
  }

  depends_on = [libvirt_volume.worker1_disk]
}

# Worker 1 disk
resource "libvirt_volume" "worker1_disk" {
  name           = "k3s-worker-1.qcow2"
  base_volume_id = libvirt_image.ubuntu.id
  size           = 20 * 1024 * 1024 * 1024  # 20GB in bytes
}

# Worker VM 2
resource "libvirt_domain" "k3s_worker2" {
  name   = "k3s-worker-2"
  memory = 2048  # 2GB in MB
  vcpu   = 2

  disk {
    volume_id = libvirt_volume.worker2_disk.id
  }

  network_interface {
    network_name = "default"
  }

  console {
    type        = "pty"
    target_port = 0
  }

  depends_on = [libvirt_volume.worker2_disk]
}

# Worker 2 disk
resource "libvirt_volume" "worker2_disk" {
  name           = "k3s-worker-2.qcow2"
  base_volume_id = libvirt_image.ubuntu.id
  size           = 20 * 1024 * 1024 * 1024  # 20GB in bytes
}