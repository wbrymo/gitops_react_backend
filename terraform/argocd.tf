resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  timeout          = 600
  wait             = true

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }
}