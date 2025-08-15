package main

import (
	"api/config"
	"api/internal/routes"
	"log"

	"github.com/gofiber/fiber/v2"
)

func main() {
	// Load ENV
	config.LoadEnv()

	// Init Fiber
	app := fiber.New()

	// Setup Routes
	routes.SetupRoutes(app)

	// Run Server
	log.Fatal(app.Listen(":3000"))
}
