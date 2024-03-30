FROM golang:1.22.0

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY main.go parcel.go parcel_test.go tracker.db ./ 
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o ./bin/parcel

CMD ["./bin/parcel"]
