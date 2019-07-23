helminstall:
		helm install ../jekyll \
		--name myjekyll \
		--set fullnameOverride=myjekyll  \
		--set jekyll_host=www.zeusro.tech \
		--set ingress.hosts={www.zeusro.tech} 

uninstall:
		helm delete myjekyll

debug:
		helm install ../jekyll  \
		--name myjekyll \
		--set fullnameOverride=myjekyll  \
		--set jekyll_host=www.zeusro.tech \
		--set ingress.hosts={www.zeusro.tech} \
		--debug  \
		--dry-run