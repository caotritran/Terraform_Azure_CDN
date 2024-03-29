# data "azurerm_resource_group" "tf_resource_group" {
#   name     = var.azurerm_resource_group
#   location = var.resource_group_location
# }

# resource "azurerm_cdn_profile" "tf_profile" {
#   name                = "test"
#   location            = azurerm_resource_group.tf_resource_group.location
#   resource_group_name = azurerm_resource_group.tf_resource_group.name
#   sku                 = "Premium_Verizon"
# }

resource "azurerm_cdn_endpoint" "tf_endpoint" {
  name                = var.prefix_domain
  profile_name        = var.azurerm_cdn_profile
  location            = var.resource_group_location
  resource_group_name = var.azurerm_resource_group
  querystring_caching_behaviour = "NotSet"
  is_http_allowed               = true
  is_https_allowed              = true
  optimization_type             = "GeneralWebDelivery"

  origin {
    name      = var.prefix_domain
    host_name = var.domain
#     http_port = 80
#     https_port = 443
  }
}

# data "azurerm_dns_zone" "dns_zone" {
#   name                = var.domain
#   resource_group_name = azurerm_resource_group.tf_resource_group.name
# }

# resource "azurerm_dns_cname_record" "cname_record" {
#   name                = "example"
#   zone_name           = data.azurerm_dns_zone.dns_zone.name
#   resource_group_name = data.azurerm_dns_zone.dns_zone.resource_group_name
#   ttl                 = 3600
#   target_resource_id  = azurerm_cdn_endpoint.custom_domain.id
# }

# resource "azurerm_cdn_endpoint_custom_domain" "custom_domain" {
#   name            = "custom-domain"
#   cdn_endpoint_id = azurerm_cdn_endpoint.tf_endpoint.id
#   host_name       = "cdn.${var.domain}"
#   cdn_managed_https {
#     certificate_type = "Shared"
#     protocol_type    = "IPBased"
#     tls_version      = "None"
#   }
#}
