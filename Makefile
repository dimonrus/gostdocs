run:
	docsify serve .

docker:
	docker build -f Dockerfile -t registry.s2dy.ru/gost/docs .