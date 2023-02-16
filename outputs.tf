output "url" {
  value = "https://${azurerm_cdn_endpoint.tf_endpoint.name}.azureedge.net"
}

output "cname_url" {
  value = azurerm_cdn_endpoint_custom_domain.custom_domain.host_name
}