resource "azurerm_service_plan" "sp-ui" {
  name = "spui-${var.resource_group_name}-${var.environment}"
  location = var.location
  resource_group_name =  "rg-${var.resource_group_name}-${var.environment}"
  sku_name = "B1"
  os_type = "Linux"
  tags = var.tags
}

resource "azurerm_linux_web_app" "webapp-ui" {
    name = "ui-${var.resource_group_name}-${var.environment}"
    location = var.location
    resource_group_name = "rg-${var.resource_group_name}-${var.environment}"
    service_plan_id = azurerm_service_plan.sp-ui.id

    site_config {
        always_on = true
        application_stack {
          docker_registry_url = "https://index.docker.io"
          docker_image_name = "nginx:latest"
        }
    }

    app_settings = {
      WEBSITES_PORT = 80
    }

    tags = var.tags
}

resource "azurerm_linux_web_app" "webapp-ui-admin" {
    name = "admin-ui-${var.resource_group_name}-${var.environment}"
    location = var.location
    resource_group_name = "rg-${var.resource_group_name}-${var.environment}"
    service_plan_id = azurerm_service_plan.sp-ui.id

    site_config {
        always_on = true
        application_stack {
          docker_registry_url = "https://index.docker.io"
          docker_image_name = "nginx:latest"
        }
    }

    app_settings = {
      WEBSITES_PORT = 80
    }

    tags = var.tags
}