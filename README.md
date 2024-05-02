# ASCIIGram
## Description

`ASCIIGram` is a social image sharing platform used for educationnal purposes. It is a great demo app to learn
cloud deployment with standard technologies like: docker, redis or postgresql. In order to deploy this app,
the user should understand networking, databases, secrets sharing, IAM.

* `PostgreSQL` is used to store images metadata and votes
* `Cloud Storage` stores the binary images
* `Redis` caches ascii, TTL is configurable


## Usage
```
$ ./asciigram -help
Usage of ./asciigram:
  -print-defaults
        Print default configurations
```

This application is only configurable by ENV VARS:

```
Default configurations:
        CACHE_TTL="60s"
        LISTEN_ADDR="0.0.0.0"
        LISTEN_PORT="8080"
        PG_DBNAME="asciigram"
        PG_HOST="127.0.0.1"
        PG_PASSWORD="postgres"
        PG_PORT="5432"
        PG_USER="postgres"
        REDIS_HOST="127.0.0.1"
        REDIS_PORT="6379"
        STORAGE_BUCKET="asciigram-posts-dev"
        STORAGE_BUCKET_REGION="eu-west3"
        STORAGE_TYPE="s3" ["s3","gs"]
```

This app will authenticate with the service account of the machine.

### Health Check

There's a route returning `200 OK` on `/healthz`

## Download

There is an automated build available, ask your trainer for the official docker image location.


## Compile

### Docker

    docker build -t asciigram .

### With Go

    go build -o asciigram asciigram/server
