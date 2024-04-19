FROM golang:1.8 AS build

WORKDIR /src

COPY . .

RUN go build -ldflags '-s -w' fullcycle.go

FROM scratch

COPY --from=build /src /

CMD ["./fullcycle"]
