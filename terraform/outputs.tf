output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}

output "container_app_environment_id" {
  value = azurerm_container_app_environment.container_environment.id
}