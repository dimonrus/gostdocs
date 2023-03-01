run:
	docsify serve .

build:
	docker build -f Dockerfile -t registry.s2dy.ru/gost/docs .

docker:
	docker run -itp 3000:3000 -v $(pwd):/docs registry.s2dy.ru/gost/docs