variable "commit_sha" {
  type =  string
}

variable "impersonate-service-account" {
  type =  string
}


source "googlecompute" "packer-image" {
  project_id = "burner-racgupta1"
  source_image_family = "centos-7"
  #source_image = "rhel-7-v20220920"
  ssh_timeout = "2m"
  # zone                = "us-central1-a"
  zone              = "us-central1-a"
  image_description = "Created with Packer from Cloudbuild"
  ssh_username      = "racgupta1"
  tags       = ["allow-packer-ssh"]
  subnetwork = "packer-network"
  on_host_maintenance = "TERMINATE"
  #impersonate_service_account = var.impersonate-service-account
  
}



build {
  sources = ["sources.googlecompute.packer-image"]
  # Copy GPU Image init script to the Packer VM
  provisioner "file" {
    direction = "upload"
    source = "./validate.sh"
    destination = "/tmp/validate.sh"
  }

   provisioner "shell" {
    script          = "./validate.sh"
    execute_command = "chmod +x {{ .Path }}; {{ .Vars }} sudo -E {{ .Path }}"
   }
}
