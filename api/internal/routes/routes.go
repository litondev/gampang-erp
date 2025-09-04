package routes

import (
	"api/internal/middlewares"

	"github.com/gofiber/fiber/v2"
	jwtware "github.com/gofiber/jwt/v3"
	"gorm.io/gorm"

	"api/internal/handlers/auth"
)

func SetupRoutes(app *fiber.App, db *gorm.DB, debug string) {
	// CORS MIDDLEWARE
	app.Use(middlewares.CorsMiddleware())

	// GLOBAL MIDDLEWARE
	app.Use(middlewares.MiddlewareGlobal(db, debug))

	// JWT MIDDLEWARE
	app.Use(jwtware.New(jwtware.Config{
		SigningKey: []byte("secret"),
		ErrorHandler: func(c *fiber.Ctx, err error) error {
			return c.Status(fiber.StatusUnauthorized).JSON(fiber.Map{
				"message": "Token tidak valid",
			})
		},
	}))

	// ASSET MIDDLEWARE
	app.Static("/assets", "./assets")

	api := app.Group("/api")

	api.Get("/status", func(c *fiber.Ctx) error {
		return c.Status(200).JSON(fiber.Map{
			"message": "active",
		})
	})

	api.Post("/login", auth.Login)

	setupAuth(api)
}
