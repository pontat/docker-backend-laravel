up:
	docker compose up -d
down:
	docker compose down
build:
	docker compose build --no-cache
restart:
	make down && make up
back:
	docker compose exec backend bash
lint:
	docker compose exec backend ./vendor/bin/phpstan analyse --memory-limit=2G
test:
	docker compose exec backend php artisan test --coverage
ci:
	make lint && make test
ide-helper:
	docker compose exec backend php artisan ide-helper:model
db-fresh:
	docker compose exec backend php artisan migrate:fresh --seed