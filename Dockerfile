FROM golang:1.14-alpine

# Set the Current Working Directory inside the container
WORKDIR /app/netgear_cm_exporter

COPY go.* /app/netgear_cm_exporter/
RUN go mod download

COPY *.go /app/netgear_cm_exporter/
COPY netgear_cm_exporter.yml .

RUN go build -o ./out/netgear_cm_exporter .
EXPOSE 8080
CMD ["./out/netgear_cm_exporter"]