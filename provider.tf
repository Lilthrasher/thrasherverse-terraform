terraform {

  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "3.0.2-rc06"
    }
  }
}

variable "PROXMOX_URL" {
  type = string
}

variable "PROXMOX_ID" {
  type      = string
  sensitive = true
}

variable "PROXMOX_TOKEN" {
  type      = string
  sensitive = true
}

provider "proxmox" {
  pm_api_url = var.PROXMOX_URL
  pm_api_token_id = var.PROXMOX_ID
  pm_api_token_secret = var.PROXMOX_TOKEN
  
  pm_tls_insecure = true
}
