FROM golang:1.22 AS build
RUN mkdir -p /asciigram
WORKDIR /asciigram
COPY ./ ./
RUN go build -o out asciigram/server

FROM gcr.io/distroless/base-debian12
COPY --from=build /asciigram/out /usr/local/bin/asciigram
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/asciigram"]