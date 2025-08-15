package routes

import (
	"github.com/gofiber/fiber/v2"
	"myapp/internal/handlers"
)

func SetupRoutes(app *fiber.App) {
	api := app.Group("/api")
	api.Get("/users", handlers.GetUsers)
}
