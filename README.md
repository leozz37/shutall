# Shutall

<img align="right" width="280px" src="./resources/mascot.png">

[![Go](https://github.com/leozz37/shutall/actions/workflows/go.yaml/badge.svg)](https://github.com/leozz37/shutall/actions/workflows/go.yaml)
[![Go Report Card](https://goreportcard.com/badge/github.com/leozz37/shutall)](https://goreportcard.com/report/github.com/leozz37/shutall)
[![GoDoc](https://pkg.go.dev/badge/github.com/leozz37/shutall?status.svg)](https://pkg.go.dev/github.com/leozz37/shutall?tab=doc)
![GitHub go.mod Go version](https://img.shields.io/github/go-mod/go-version/leozz37/shutall)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Shutall is a graceful shutdown package that makes your code short and functional, dealing with any kind of interruption from OS and works with all the major web frameworks.

## Examples

### Gin

```go
package main

import (
    "github.com/gin-gonic/gin"
    "github.com/leozz37/shutall"
)

func main() {
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})

	svr := &http.Server{
		Addr:    "8080",
		Handler: r,
	}
	Run(svr, 2*time.Second)
}
```

### Echo

```go
package main

import (
    "github.com/labstack/echo"
    "github.com/leozz37/shutall"
)

func main() {
	e := echo.New()
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello, World!")
	})

	svr := &http.Server{
		Addr:    "8080",
		Handler: e,
	}
	Run(svr, 2*time.Second)
}

```

### Fiber


```go
package main

import "github.com/gofiber/fiber/v2"

func main() {
    app := fiber.New()

    app.Get("/", func(c *fiber.Ctx) error {
        return c.SendString("Hello, World 👋!")
    })

    svr := &http.Server{
		Addr:    "8080",
		Handler: app,
	}
	Run(svr, 2*time.Second)
}
```