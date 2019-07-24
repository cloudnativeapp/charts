helminstall:
		helm install ../codis \
		--name codis-prod \
		--set fullnameOverride=codis-prod  

uninstall:
		helm delete codis-prod
		helm del --purge codis-prod

debug:
		helm install ../codis  \
		--set fullnameOverride=codis-prod  \
		--set hexo_host=blog.zeusro.tech \
		--debug  \
		--dry-run