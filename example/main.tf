## kubernetes node termination handler
module "helm-release" {
  source = "../.."
  release = {
    aws-node-termination-handler = {
      repository_name     = "eks-charts"
      chart               = "aws-node-termination-handler"
      repository          = "https://aws.github.io/eks-charts"
      repository_username = null
      repository_password = null
      version             = null
      verify              = false
      reuse_values        = false
      reset_values        = false
      force_update        = false
      timeout             = 3600
      recreate_pods       = false
      max_history         = 200
      wait                = false
      values              = null
      set                 = null
      namespace           = "kube-system"
      create_namespace    = true
    }
    metrics-server = {
      repository_name     = "stable"
      chart               = "metrics-server"
      repository          = "https://charts.helm.sh/stable"
      repository_username = null
      repository_password = null
      version             = null
      verify              = false
      reuse_values        = false
      reset_values        = false
      force_update        = false
      timeout             = 3600
      recreate_pods       = false
      max_history         = 200
      wait                = false
      values              = null
      set                 = null
      namespace           = "kube-system"
      create_namespace    = true
      set = [
        {
          name  = "args[0]"
          value = "--kubelet-preferred-address-types=InternalIP"
        }
      ]
    }
  }
}
