clean:
	flutter clean
.PHONY: clean

build:
	flutter build web
.PHONY: build

local_server: build
	python3 -m  http.server 8000 --directory build/web
.PHONY: local_server

cloud_build:
	gcloud builds submit
.PHONY: cloud_build