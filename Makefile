build:
	docker build --tag="logstash" .

run:
	docker run --publish=9200:9200 --rm --name elasticsearch x110dc/docker-elasticsearch &
# this is an ugly hack but I was tired of deleting the ES container and I can't do both -d and --rm
	sleep 1
	docker run -i -t --publish=514:514 --link elasticsearch:es logstash bash
