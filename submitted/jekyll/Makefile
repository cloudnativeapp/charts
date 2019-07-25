helminstall:
		helm install ../jekyll \
		--name myjekyll \
		--set fullnameOverride=myjekyll  \
		--set ingress.hosts={www.zeusro.tech} 

uninstall:
		helm delete myjekyll
		helm del --purge myjekyll

debug:
		helm install ../jekyll  \
		--name myjekyll \
		--set fullnameOverride=myjekyll  \
		--set ingress.hosts={www.zeusro.tech} \
		--debug  \
		--dry-run