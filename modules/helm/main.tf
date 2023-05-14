resource "helm_release" "example" {
  name       = "my-local-chart"
  chart      = "${path.cwd}/sample-app"
}