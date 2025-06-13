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

resource "proxmox_vm_qemu" "reverb" {
    name = "reverb"
    target_node = "pve"
    vmid = "100"
    vm_state = "started"

    clone = "thrasherverse-lvm"
    full_clone  = true

    bios = "ovmf"
    machine = "q35"

    memory = 16384
    scsihw = "virtio-scsi-single"

    onboot = true
    agent = 1
    tags = "docker"

    ciuser = var.VM_USERNAME
    cipassword = var.VM_PASSWORD
    sshkeys = var.VM_SSH_KEY
    nameserver = "10.27.1.1 8.8.8.8"
    ipconfig0 = "ip=10.27.1.50/24,gw=10.27.1.1"

    cpu {
        cores = 8
        sockets = 1
        type = "host"
    }

    network {
        id = 0
        model = "virtio"
        bridge = "vmbr0"
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
                    size = "128G"
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

resource "proxmox_vm_qemu" "deora1" {
    name = "deora1"
    target_node = "hapve1"
    vmid = "300"
    vm_state = "started"

    clone = "thrasherverse-ceph"
    full_clone  = true

    bios = "ovmf"
    machine = "q35"

    memory = 6144
    scsihw = "virtio-scsi-single"

    onboot = true
    agent = 1
    tags = "docker-swarm"

    ciuser = var.VM_USERNAME
    cipassword = var.VM_PASSWORD
    sshkeys = var.VM_SSH_KEY
    nameserver = "10.27.1.1 8.8.8.8"
    ipconfig0 = "ip=10.27.1.60/24,gw=10.27.1.1"

    cpu {
        cores = 4
        sockets = 1
        type = "host"
    }

    network {
        id = 0
        model = "virtio"
        bridge = "vmbr0"
    }

    disks {
        ide {
            ide2 {
                cloudinit {
                    storage = "local-ceph"
                }
            }
        }
        scsi {
            scsi0 {
                disk {
                    storage = "local-ceph"
                    size = "128G"
                    discard = true
                }
            }
        }    
    }

}

resource "proxmox_vm_qemu" "deora2" {
    name = "deora2"
    target_node = "hapve2"
    vmid = "301"
    vm_state = "started"

    clone = "thrasherverse-ceph"
    full_clone  = true

    bios = "ovmf"
    machine = "q35"

    memory = 6144
    scsihw = "virtio-scsi-single"

    onboot = true
    agent = 1
    tags = "docker-swarm"

    ciuser = var.VM_USERNAME
    cipassword = var.VM_PASSWORD
    sshkeys = var.VM_SSH_KEY
    nameserver = "10.27.1.1 8.8.8.8"
    ipconfig0 = "ip=10.27.1.70/24,gw=10.27.1.1"

    cpu {
        cores = 4
        sockets = 1
        type = "host"
    }

    network {
        id = 0
        model = "virtio"
        bridge = "vmbr0"
    }

    disks {
        ide {
            ide2 {
                cloudinit {
                    storage = "local-ceph"
                }
            }
        }
        scsi {
            scsi0 {
                disk {
                    storage = "local-ceph"
                    size = "128G"
                    discard = true
                }
            }
        }    
    }

}

# resource "null_resource" "ansible_playbook" {
#     depends_on = [ proxmox_vm_qemu.reverb, proxmox_vm_qemu.deora1, proxmox_vm_qemu.deora2 ]

#     triggers = {
#         always_run = timestamp()
#     }

#     provisioner "local-exec" {
#         command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook ../ansible/run.yaml -i ../ansible/hosts --vault-password-file=../ansible/pass"
#     }
# }