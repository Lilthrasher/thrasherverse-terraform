variable "VM_USERNAME" {
    type = string
}

variable "VM_PASSWORD" {
    type = string
    sensitive = true
}

variable "VM_SSH_KEY" {
    type = string
    sensitive = true
}

resource "proxmox_vm_qemu" "nitrium" {
    name = "nitrium"
    target_node = "pve-prod"
    vmid = "100"

    clone = "thrasherverse-lvm"
    full_clone  = true

    bios = "ovmf"
    machine = "q35"

    memory = 4096
    scsihw = "virtio-scsi-single"

    onboot = true
    agent = 1
    tags = "docker"

    ciuser = var.VM_USERNAME
    cipassword = var.VM_PASSWORD
    sshkeys = var.VM_SSH_KEY
    nameserver = "10.27.2.1 1.1.1.1"
    ipconfig0 = "ip=10.27.2.5/24,gw=10.27.2.1"

    cpu {
        cores = 4
        sockets = 1
        type = "host"
    }

    network {
        id = 0
        model = "virtio"
        bridge = "vmbr1"
    }

    efidisk {
        efitype = "4m"
        storage = "local-lvm"
    }

    disks {
        ide {
            ide2 {
                cloudinit {
                    storage = "local-lvm"
                }
            }
        }
        scsi {
            scsi0 {
                disk {
                    storage = "local-lvm"
                    size = "256G"
                    discard = true
                }
            }
        }    
    }

}

resource "proxmox_vm_qemu" "reverb" {
    name = "reverb"
    target_node = "pve-prod"
    vmid = "101"

    clone = "thrasherverse-lvm"
    full_clone  = true

    bios = "ovmf"
    machine = "q35"

    memory = 8192
    scsihw = "virtio-scsi-single"

    onboot = true
    agent = 1
    tags = "docker"

    ciuser = var.VM_USERNAME
    cipassword = var.VM_PASSWORD
    sshkeys = var.VM_SSH_KEY
    nameserver = "10.27.2.1 1.1.1.1"
    ipconfig0 = "ip=10.27.2.10/24,gw=10.27.2.1"

    cpu {
        cores = 4
        sockets = 1
        type = "host"
    }

    network {
        id = 0
        model = "virtio"
        bridge = "vmbr1"
    }

    efidisk {
        efitype = "4m"
        storage = "local-lvm"
    }

    disks {
        ide {
            ide2 {
                cloudinit {
                    storage = "local-lvm"
                }
            }
        }
        scsi {
            scsi0 {
                disk {
                    storage = "local-lvm"
                    size = "256G"
                    discard = true
                }
            }
        }    
    }


}

resource "proxmox_vm_qemu" "rivited" {
    name = "rivited"
    target_node = "pve-prod"
    vmid = "200"

    clone = "thrasherverse-lvm"
    full_clone  = true

    bios = "ovmf"
    machine = "q35"

    memory = 4096
    scsihw = "virtio-scsi-single"

    onboot = true
    agent = 1
    tags = "docker"

    ciuser = var.VM_USERNAME
    cipassword = var.VM_PASSWORD
    sshkeys = var.VM_SSH_KEY
    nameserver = "10.27.3.1 1.1.1.1"
    ipconfig0 = "ip=10.27.3.10/24,gw=10.27.3.1"
    ipconfig1 = "ip=10.27.100.2/24"

    cpu {
        cores = 4
        sockets = 1
        type = "host"
    }

    network {
        id = 0
        model = "virtio"
        bridge = "vmbr2"
    }

    network {
        id = 1
        model = "virtio"
        bridge = "vmbr4"
    }

    efidisk {
        efitype = "4m"
        storage = "local-lvm"
    }

    disks {
        ide {
            ide2 {
                cloudinit {
                    storage = "local-lvm"
                }
            }
        }
        scsi {
            scsi0 {
                disk {
                    storage = "local-lvm"
                    size = "256G"
                    discard = true
                }
            }
        }    
    }

}

resource "proxmox_vm_qemu" "anthracite" {
    name = "anthracite"
    target_node = "pve-prod"
    vmid = "300"

    clone = "thrasherverse-lvm"
    full_clone  = true

    bios = "ovmf"
    machine = "q35"

    memory = 16384
    scsihw = "virtio-scsi-single"

    onboot = true
    agent = 1
    tags = "dmz"

    ciuser = var.VM_USERNAME
    cipassword = var.VM_PASSWORD
    sshkeys = var.VM_SSH_KEY
    nameserver = "10.27.5.1 1.1.1.1"
    ipconfig0 = "ip=10.27.5.10/24,gw=10.27.5.1"

    cpu {
        cores = 6
        sockets = 1
        type = "host"
    }

    network {
        id = 0
        model = "virtio"
        bridge = "vmbr3"
    }

    efidisk {
        efitype = "4m"
        storage = "local-lvm"
    }

    disks {
        ide {
            ide2 {
                cloudinit {
                    storage = "local-lvm"
                }
            }
        }
        scsi {
            scsi0 {
                disk {
                    storage = "local-lvm"
                    size = "256G"
                    discard = true
                }
            }
        }    
    }

}

resource "proxmox_vm_qemu" "chicane" {
    name = "chicane"
    target_node = "pve-prod"
    vmid = "301"

    clone = "thrasherverse-lvm"
    full_clone  = true

    bios = "ovmf"
    machine = "q35"

    memory = 8192
    scsihw = "virtio-scsi-single"

    onboot = true
    agent = 1
    tags = "dmz"

    ciuser = var.VM_USERNAME
    cipassword = var.VM_PASSWORD
    sshkeys = var.VM_SSH_KEY
    nameserver = "10.27.5.1 1.1.1.1"
    ipconfig0 = "ip=10.27.5.20/24,gw=10.27.5.1"

    cpu {
        cores = 4
        sockets = 1
        type = "host"
    }

    network {
        id = 0
        model = "virtio"
        bridge = "vmbr3"
    }

    efidisk {
        efitype = "4m"
        storage = "local-lvm"
    }

    disks {
        ide {
            ide2 {
                cloudinit {
                    storage = "local-lvm"
                }
            }
        }
        scsi {
            scsi0 {
                disk {
                    storage = "local-lvm"
                    size = "256G"
                    discard = true
                }
            }
        }    
    }

    # pcis {
    #     pci0 {
    #         raw {
    #             raw_id = "0000:03:00.0"
    #             pcie = true
    #         }
    #     }
    #     pci1 {
    #         raw {
    #             raw_id = "0000:04:00.0"
    #             pcie = true
    #         }
    #     }
    # }

}