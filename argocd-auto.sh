export PATH=/github-runner/.local/bin:/github-runner/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin


argocd_ip=$(kubectl get svc -n argocd argocd-server -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
argocd_password=$(kubectl get secret argocd-initial-admin-secret -n argocd -o=jsonpath='{.data.password}' | base64 --decode)
argocd login argocd-dev.azdevopsb82.online:443 --insecure --username admin --password ${argocd_password} --grpc-web

for app_name in cart catalogue user shipping payment frontend; do

appImage=$(gh search commits --repo raghudevopsb82/roboshop-$app_name "RoboSHop" | head -1 | awk '{print $2}')
argocd app create --upsert ${app_name} --repo https://github.com/raghudevopsb82/roboshop-helm.git --dest-namespace default --dest-server https://kubernetes.default.svc --values env-dev/${app_name}.yaml  --path . --helm-set appImage=roboshopb82new.azurecr.io/roboshop-$app_name:$appImage --grpc-web
argocd app sync ${app_name} --grpc-web
done
