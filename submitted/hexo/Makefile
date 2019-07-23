helminstall:
		helm install ../hexo \
		--name myhexo \
		--set fullnameOverride=myhexo  \
		--set hexo_host=blog.zeusro.tech \
		--set ingress.hosts={blog.zeusro.tech} \

uninstall:
		helm delete myhexo

debug:
		helm install ../hexo  \
		--set fullnameOverride=myhexo  \
		--set hexo_host=blog.zeusro.tech \
		--set ingress.hosts={blog.zeusro.tech} \
		--debug  --dry-run