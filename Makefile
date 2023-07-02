#BUILD
docker-build:
	docker-compose build

docker-build-no-cache:
	docker-compose build --no-cache


#SETUPDB
docker-setupdb:
	docker-compose run api bundle exec rake db:drop db:create
	docker-compose run api bundle exec rake db:drop db:create RAILS_ENV=test
#RUN
docker-run:
	docker-compose up

