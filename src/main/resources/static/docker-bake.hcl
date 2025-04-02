group "default" {
  targets = ["app"]
}

target "app" {
  context    = "."
  dockerfile = "Dockerfile"
  tags = ["mowoh/spark-demo:latest"]


  args = {
    JAVA_OPTS = "-XX:+UseContainerSupport -XX:MaxRAMPercentage=75.0"
  }

  labels = {
    "maintainer" = "mowoh"
  }

  volumes = ["/app/data"]

  expose = [8080]

  healthcheck = {
    test = ["CMD", "wget", "-q", "--spider", "http://localhost:8080/actuator/health"]
    interval = "30s"
    timeout  = "3s"
    retries  = 3
  }
}
