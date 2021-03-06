VERSION  := latest
IMG_NAME := deepu105/kdash
IMAGE    := ${IMG_NAME}:${VERSION}

default: run

 ## Run all tests
test:  
	@cargo check && cargo test

## Builds the app for current os-arch
build:  
	@cargo clean && cargo fmt && cargo check && cargo build --release

## Runs the app
run:  
	@cargo fmt && cargo clippy && cargo run

## Run clippy
lint:  
	@find . | grep "\.rs$" | xargs touch ; cargo clippy

## Force Run clippy
lint-force:  
	@cargo clean && cargo clippy

## Fix lint
lint-fix:  
	@cargo fix

## Run format
fmt:  
	@cargo fmt

## Build a Docker Image
docker:    
	@DOCKER_BUILDKIT=1 docker build --rm -t ${IMAGE} .

## Run Docker Image locally
docker-run:    
	@docker run --rm ${IMAGE}