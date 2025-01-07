resource "proxmox_vm_qemu" "control-plane" {
  name        = "control-plane"
  desc        = "K8S Control Plane"
  target_node = "eva-00"
  vmid        = 200
  clone       = "cloud-init-2204-noble"
  full_clone  = true
  agent       = 1
  os_type     = "cloud-init"
  bios        = "seabios"
  cores       = 2
  sockets     = 1
  cpu_type    = "host"
  memory      = 2048
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  onboot      = true
  vm_state    = "started"

  disk {
    type    = "cloudinit"
    storage = "local-ssd"
    slot    = "ide2"
  }

  disk {
    type     = "disk"
    storage  = "local-ssd"
    size     = "54784M"
    slot     = "scsi0"
    discard  = true
    iothread = true
  }

  network {
    id       = 0
    model    = "virtio"
    bridge   = "vmbr0"
    firewall = false
  }

  ciuser     = "fer"
  cipassword = "Gregory08*"
  ipconfig0  = "ip=192.168.1.18/24,gw=192.168.1.1"
  nameserver = "8.8.8.8"
  ciupgrade  = true
  sshkeys    = <<EOF
  ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA your@email.com
  EOF
}

resource "proxmox_vm_qemu" "worker1" {
  name        = "worker1"
  desc        = "K8S Worker1"
  target_node = "eva-00"
  vmid        = 201
  clone       = "cloud-init-2204-noble"
  full_clone  = true
  agent       = 1
  os_type     = "cloud-init"
  bios        = "seabios"
  cores       = 2
  sockets     = 1
  cpu_type    = "host"
  memory      = 2048
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  onboot      = true
  vm_state    = "started"

  disk {
    type    = "cloudinit"
    storage = "local-ssd"
    slot    = "ide2"
  }

  disk {
    type     = "disk"
    storage  = "local-ssd"
    size     = "54784M"
    slot     = "scsi0"
    discard  = true
    iothread = true
  }

  network {
    id       = 0
    model    = "virtio"
    bridge   = "vmbr0"
    firewall = false
  }
  ciuser     = "fer"
  cipassword = "Gregory08*"
  ipconfig0  = "ip=192.168.1.20/24,gw=192.168.1.1"
  nameserver = "8.8.8.8"
  ciupgrade  = true
  sshkeys    = <<EOF
  ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA your@email.com
  EOF
}

resource "proxmox_vm_qemu" "worker2" {
  name        = "worker2"
  desc        = "K8S Worker2"
  target_node = "eva-00"
  vmid        = 202
  clone       = "cloud-init-2204-noble"
  full_clone  = true
  agent       = 1
  os_type     = "cloud-init"
  bios        = "seabios"
  cores       = 2
  sockets     = 1
  cpu_type    = "host"
  memory      = 2048
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  onboot      = true
  vm_state    = "started"

  disk {
    type    = "cloudinit"
    storage = "local-ssd"
    slot    = "ide2"
  }

  disk {
    type     = "disk"
    storage  = "local-ssd"
    size     = "54784M"
    slot     = "scsi0"
    discard  = true
    iothread = true
  }

  network {
    id       = 0
    model    = "virtio"
    bridge   = "vmbr0"
    firewall = false
  }
  ciuser     = "fer"
  cipassword = "Gregory08*"
  ipconfig0  = "ip=192.168.1.21/24,gw=192.168.1.1"
  nameserver = "8.8.8.8"
  ciupgrade  = true
  sshkeys    = <<EOF
  ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA your@email.com
  EOF
}