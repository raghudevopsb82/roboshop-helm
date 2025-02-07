argocd_ip=$(kubectl get svc -n argocd argocd-server -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
argocd_password=$(kubectl get secret argocd-initial-admin-secret -n argocd -o=jsonpath='{.data.password}' | base64 --decode)
argocd login ${argocd_ip} --insecure --username admin --password ${argocd_password}

