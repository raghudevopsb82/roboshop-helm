default:
	helm install $(appName) . -f env-$(env)/$(appName).yaml

