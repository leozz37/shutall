# Shutall

<img align="right" width="159px" src="./resources/mascot.png">



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