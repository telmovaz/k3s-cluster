output "master_vm_id" {
  description = "Master VM ID"
  value       = libvirt_domain.k3s_master.id
}

output "worker1_vm_id" {
  description = "Worker 1 VM ID"
  value       = libvirt_domain.k3s_worker1.id
}

output "worker2_vm_id" {
  description = "Worker 2 VM ID"
  value       = libvirt_domain.k3s_worker2.id
}

output "vms" {
  description = "All VM information"
  value = {
    master = {
      name   = libvirt_domain.k3s_master.name
      id     = libvirt_domain.k3s_master.id
    }
    worker1 = {
      name = libvirt_domain.k3s_worker1.name
      id   = libvirt_domain.k3s_worker1.id
    }
    worker2 = {
      name = libvirt_domain.k3s_worker2.name
      id   = libvirt_domain.k3s_worker2.id
    }
  }
}