# This is a make file to help simplify some of the docker commands we use for running things.

build: 
	docker-compose build

start:
	docker-compose up -d

start-nobackground:
	docker-compose up

stop:
	docker-compose stop

rspec:
	docker-compose run -e "RAILS_ENV=test" web rspec spec/

db_dev_migrate:
	docker-compose run web rake db:create && docker-compose run web rake db:migrate

db_dev_drop:
	docker-compose run web rake db:drop

db_dev_reset: db_dev_drop	db_dev_migrate
