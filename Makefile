build:
	docker-compose build app
bash:
	docker-compose run app bash
app:
	docker-compose -f docker-compose.yml down; docker-compose run --service-ports app;
deloy:
	npm run build