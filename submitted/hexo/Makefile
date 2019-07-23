helminstall:
		helm install ../hexo \
		--name myhexo \
		--set fullnameOverride=myhexo  \
		--set hexo_host=blog.zeusro.tech \
		--set ingress.hosts={blog.zeusro.tech} \
		--set public_hexo_github_url=https://github.com/zeusro/docker-hexo.git 

uninstall:
		helm delete myhexo
		helm del --purge myhexo

debug:
		helm install ../hexo  \
		--set fullnameOverride=myhexo  \
		--set hexo_host=blog.zeusro.tech \
		--set ingress.hosts={blog.zeusro.tech} \
		--set public_hexo_github_url=https://github.com/zeusro/docker-hexo.git \
		--debug  \
		--dry-run