PWD=$(shell pwd)
run:
	docsify serve .

build:
	docker build -f Dockerfile --platform linux/amd64 -t registry.s2dy.ru/gost/docs .

docker:
	docker run -itp 3000:3000 -v $(PWD):/docs registry.s2dy.ru/gost/docs

push:
	docker push registry.s2dy.ru/gost/docs