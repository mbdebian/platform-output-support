// --- RELEASE INFORMATION --- //
variable "config_release_name" {
  description = "Open Targets Platform release name, not related to any configuration parameter."
  type = string
}

variable "config_gcp_default_region" {
  description = "Default region when not specified in the module"
  type = string
}

variable "config_gcp_default_zone" {
  description = "Default zone when not specified in the module"
  type = string
}

variable "config_project_id" {
  description = "Default project to use when not specified in the module"
  type = string
}

// --- ETL info --- //
variable "config_gs_etl" {
  description = "Output of the ETL [root]. Eg. open-targets-data-releases/21.04/output"
  type = string
}

// --- Elastic Search Configuration --- //

variable "config_vm_elastic_boot_image" {
  description = "Boot image configuration for the deployed Elastic Search Instances"
  type = string
  default = "projects/cos-cloud/global/images/family/cos-stable"
}


variable "config_vm_elastic_search_vcpus" {
  description = "CPU count configuration for the deployed Elastic Search Instances"
  type = number
}

variable "config_vm_elastic_search_mem" {
  description = "RAM configuration for the deployed Elastic Search Instances"
  type = number
}

variable "config_vm_elastic_search_version" {
  description = "Elastic search version to deploy"
  type = string
}

variable "config_vm_elastic_search_boot_disk_size" {
  description = "Boot disk size to use for the deployed Elastic Search Instances"
  type = string
}


// --- POS VM Configuration --- //

variable "config_vm_pos_boot_image" {
  description = "Boot image configuration for POS VM"
  type = string
  default = "debian-10"
}


variable "config_vm_pos_boot_disk_size" {
  description = "POS VM boot disk size, default '500GB'"
  type = string
  default = 500
}

variable "config_vm_pos_machine_type" {
  description = "Machine type for POS vm"
  type = string
  default = "projects/cos-cloud/global/images/family/debian-cloud"
}
