# README

Tech Problem for Edge

### * Ruby version
  - ruby 3.1.2p20

### * System dependencies
  - Docker
  - docker-compose

### * Configuration
  - 1. Build the image
  ```bash
    docker-compose build
  ```
  - 2. Start the server
  ```bash
    docker-compose run --rm --service-ports ruby-app
  ```

### * How to run the test suite
  ```bash
    docker-compose run ruby-ap rspec
  ```