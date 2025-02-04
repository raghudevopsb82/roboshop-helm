default:
	helm install $(appName) . -f env-$(env)/$(appName).yaml

dev:
	git pull
	helm install cart . -f env-dev/cart.yaml
	helm install catalogue . -f env-dev/catalogue.yaml
	helm install user . -f env-dev/user.yaml
	helm install payment . -f env-dev/payment.yaml
	helm install shipping . -f env-dev/shipping.yaml
	helm install frontend . -f env-dev/frontend.yaml
