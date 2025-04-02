group "default" {
  targets = ["spark-demo"]
}

target "spark-demo" {
  context = "."
  dockerfile = "Dockerfile"
  tags = ["mowoh/spark-demo:latest"]
}