install:
	helm install codis-prod \
	../codis \
	--set name=codis-prod  	

debug:
	helm install codis-prod \
	../codis \	
	--set name=codis-prod  	\
	--set fullnameOverride=codis-prod \
	--debug  \
	--dry-run 

uninstall:
	helm delete codis-prod

reinstall: uninstall  install