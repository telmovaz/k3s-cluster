variable "kvm_host" {
  description = "KVM host IP or hostname"
  type        = string
  default     = "192.168.0.108"
}

variable "kvm_user" {
  description = "SSH user for KVM host"
  type        = string
  default     = "telmo"
}

variable "pc_ip" {
  description = "IP address of the PC running libvirt"
  type        = string
}

variable "pc_user" {
  description = "Username for SSH connection to PC"
  type        = string
}