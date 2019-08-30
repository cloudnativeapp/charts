helminstall:
		helm install \
		--set expose.ingress.host=www.zeusro.tech\
        --set expose.type=ingress \
        --set expose.tls.enabled=true \
        --set expose.ingress.enabled=true \
        --set expose.tls.secretName=tls-zeusro.tech \
		mygitea \
		../gitea

uninstall:
		helm delete mygitea

debug:
		helm install \
		--set expose.ingress.host=www.zeusro.tech\
        --set expose.type=ingress \
        --set expose.tls.enabled=true \
        --set expose.ingress.enabled=true \
        --set expose.tls.secretName=tls-zeusro.tech \
		--debug  \
		--dry-run \
		mygitea \
		../gitea