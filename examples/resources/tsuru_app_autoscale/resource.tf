resource "tsuru_app_autoscale" "web" {
  app         = tsuru_app.my-app.name
  process     = "web"
  min_units   = 3
  max_units   = 10
  cpu_average = "60%"

  schedule {
    min_replicas = 5
    start = "0 18 * * *"
    end = "0 0 * * *"
    timezone = "America/Sao_Paulo"
  }

  schedule {
    min_replicas = 10
    start = "0 18 * * *"
    end = "0 19 * * *"
    timezone = "UTC"
  }
}
