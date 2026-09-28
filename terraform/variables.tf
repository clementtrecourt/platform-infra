variable "proxmox_endpoint" {
  description = "URL de l'API Proxmox (ex: https://192.168.1.100:8006/)"
  type        = string
}

variable "proxmox_api_token" {
  description = "Token API Proxmox (USER@REALM!TOKENID=UUID)"
  type        = string
  sensitive   = true
}

variable "proxmox_node_name" {
  description = "Nom de ton nœud Proxmox (ex: pve)"
  type        = string
  default     = "pve"
}

variable "datastore_id" {
  description = "Datastore Proxmox où stocker le disque (ex: local-lvm)"
  type        = string
  default     = "local-lvm"
}

variable "ssh_public_key" {
  description = "Clé SSH publique injectée pour l'utilisateur debian"
  type        = string
}

variable "vm_ip" {
  description = "Adresse IP statique avec masque CIDR (ex: 192.168.1.50/24)"
  type        = string
}

variable "gateway_ip" {
  description = "Adresse IP de la passerelle (ex: 192.168.1.1)"
  type        = string
}
