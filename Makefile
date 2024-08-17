bash:
	docker compose run --rm app bash

build:
	docker compose build

run: build
	docker compose run app ruby app.rb