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