resource "proxmox_virtual_environment_vm" "k3s_platform_node" {
  name        = "k3s-platform-node"
  description = "Managed by Terraform - Platform Engineering Node"
  node_name   = var.proxmox_node_name
  vm_id       = 150

  clone {
    vm_id = 9000 # L'ID du template créé à l'étape 1
    full  = true
  }

  agent {
    enabled = true
  }

  cpu {
    cores = 4
    type  = "host"
  }

  memory {
    dedicated = 12288 # 12 Go RAM
  }

  disk {
    datastore_id = var.datastore_id
    interface    = "scsi0"
    size         = 70 # Disque étendu à 70 Go
    discard      = "on"
    ssd          = true
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  operating_system {
    type = "l26"
  }

  initialization {
    ip_config {
      ipv4 {
        address = var.vm_ip
        gateway = var.gateway_ip
      }
    }

    user_account {
      username = "debian"
      keys     = [trimspace(var.ssh_public_key)]
    }
  }
}

output "vm_ip_address" {
  value       = var.vm_ip
  description = "IP de la VM K3s provisionnée"
}
