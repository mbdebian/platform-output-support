// Open Targets Platform Infrastructure
// Author: Manuel Bernal Llinares <mbdebian@gmail.com>

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.55.0"
    }
  }
}

provider "google" {
  region = var.config_gcp_default_region
  project = var.config_project_id
}


// --- Elastic Search Backend --- //
module "backend_elastic_search" {
  source = "./modules/elasticsearch"

  module_wide_prefix_scope = "${var.config_release_name}-es"
  // Elastic Search configuration
  vm_elastic_search_version = "${var.config_vm_elastic_search_version}"
  vm_elastic_search_vcpus = var.config_vm_elastic_search_vcpus
  // Memory size in MiB
  vm_elastic_search_mem = var.config_vm_elastic_search_mem

  // Region and zone
  vm_default_region = var.config_gcp_default_region
  vm_default_zone = var.config_gcp_default_zone
  vm_elastic_boot_image = "${var.config_vm_elastic_boot_image}"
  vm_elasticsearch_boot_disk_size = "${var.config_vm_elastic_search_boot_disk_size}"


}

module "backend_pos_vm" {
  module_wide_prefix_scope = "${var.config_release_name}-vm"
  source = "./modules/posvm"

  depends_on = [module.backend_elastic_search]

  // Region and zone
  vm_default_zone = var.config_gcp_default_zone
  vm_pos_boot_image = var.config_vm_pos_boot_image
  vm_pos_boot_disk_size = var.config_vm_pos_boot_disk_size
  vm_pos_machine_type = var.config_vm_pos_machine_type
  gs_etl = var.config_gs_etl
  vm_elasticsearch_uri = module.backend_elastic_search.elasticsearch_vm_name

}
