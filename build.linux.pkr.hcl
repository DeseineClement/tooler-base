variable "terraform_versions" {
  type = list(object({
    version = string
    default = number
  }))
}

build {
  sources = [
    "virtualbox-iso.debian"
  ]

  provisioner "shell" {
    execute_command =  "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    scripts         = [
      "scripts.d/aptitude.sh",
      "scripts.d/python.sh",
    ]
  }

  provisioner "ansible" {
    playbook_file   = "ansible.d/playbooks/shared.yml"
    extra_arguments = [
      "--extra-vars", "terraform_versions=${ jsonencode(var.terraform_versions) }"
    ]
  }

  provisioner "ansible" {
    playbook_file = "ansible.d/playbooks/virtualbox.yml"
  }

  provisioner "shell" {
    execute_command =  "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script          = "scripts.d/clean.sh"
  }
}

source "virtualbox-iso" "debian" {
  vm_name           = "tooler-base"
  headless          = true
  guest_os_type     = "Debian_64"
  iso_url           = "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.3.0-amd64-xfce-CD-1.iso"
  iso_checksum      = "47671cf75c68b8f0a2169857a7e2fe371553de3c956b87688604cc920bceb52e"
  iso_checksum_type = "sha256"
  ssh_username      = "vagrant"
  ssh_password      = "vagrant"
  ssh_timeout       = "1h"
  ssh_port          = 22
  disk_size         = 32768
  http_directory    = "http.d"
  output_directory  = "output-virtualbox-iso"
  shutdown_command  = "echo 'vagrant'|sudo -S /sbin/shutdown -hP now"

  boot_command = [
    "<esc><wait>",
    "install <wait>",
    "preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg <wait>",
    "auto <wait>",
    "locale=en_US <wait>",
    "kbd-chooser/method=fr <wait>",
    "keyboard-configuration/xkb-keymap=fr <wait>",
    "netcfg/get_hostname={{ .Name }} <wait>",
    "netcfg/get_domain=vagrantup.com <wait>",
    "fb=false <wait>",
    "debconf/frontend=noninteractive <wait>",
    "console-setup/ask_detect=false <wait>",
    "console-keymaps-at/keymap=fr <wait>",
    "<enter><wait>"
  ]

  vboxmanage = [
    [ "modifyvm", "{{.Name}}", "--memory", "2048" ],
    [ "modifyvm", "{{.Name}}", "--cpus", "1" ]
  ]
}