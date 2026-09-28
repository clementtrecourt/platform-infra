provider "proxmox" {
  endpoint = var.proxmox_endpoint
  api_token = var.proxmox_api_token
  insecure  = true # Mettre à true si certificat auto-signé Proxmox
}
