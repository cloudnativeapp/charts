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


helm3install:
		helm install ../codis \
		--set name codis-prod \
		--set fullnameOverride=codis-prod  	

helm3debug:
		helm install codis-prod \
		../codis \
		--set fullnameOverride=codis-prod  		\
		--debug  \
		--dry-run		

helm3uninstall:
		helm delete codis-prod