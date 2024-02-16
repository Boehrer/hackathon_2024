output "container" {
  description = "The container metadata provided to the module"
  value       = module.container.container
}

output "broker_ipv4" {
  description = "The public IP address of the deployed instance"
  value       = google_compute_instance.broker.network_interface.0.access_config.0.nat_ip
}

output "cos_image_name" {
  description = "The cos image used"
  value       = var.cos_image_name
}
