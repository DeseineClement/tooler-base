build {
  sources = [
    "parallels-iso.debian"
  ]

  provisioner "shell" {
    execute_command =  "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    scripts = [
      "scripts.d/aptitude.sh",
      "scripts.d/python.sh",
    ]
  }
  provisioner "ansible" {
    playbook_file = "ansible.d/playbooks/all.yml"
  }
}

source "parallels-iso" "debian" {
  vm_name                 = "tooler-base"
  guest_os_type           = "debian"
  iso_url                 = "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.3.0-amd64-netinst.iso"
  iso_checksum            = "5956434be4b81e6376151b64ef9b1596"
  iso_checksum_type       = "md5"
  parallels_tools_flavor  = "lin"
  ssh_username            = "vagrant"
  ssh_password            = "vagrant"
  ssh_timeout             = "20m"
  ssh_port                = 22
  cpus                    = 1
  disk_size               = 4096
  memory                  = 2048
  http_directory          = "http.d"
  output_directory        = "output-parallels-iso"
  shutdown_command        = "echo 'vagrant'|sudo -S /sbin/shutdown -hP now"


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
}