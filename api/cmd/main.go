package main

import (
	"api/config"
	"api/internal/routes"
	"fmt"
	"log"
	"os"

	"github.com/gofiber/fiber/v2"
	"github.com/joho/godotenv"
)

func main() {
	// Load Env
	err := godotenv.Load()
	if err != nil {
		log.Fatal("error loading .env file")
	}

	// Load Db
	db, errDb := config.Database()

	if errDb != nil {
		fmt.Println(errDb)
		os.Exit(1)
	}

	// Debug
	debug := os.Getenv("APP_DEBUG")

	// Init Fiber
	app := fiber.New()

	// Panic Recovery
	app.Use(func(c *fiber.Ctx) error {
		defer func() {
			if r := recover(); r != nil {
				log.Fatal("Recovered from panic:", r)

				c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{
					"message": "terjadi kesalahan",
				})
			}
		}()

		return c.Next()
	})

	// Setup Routes
	routes.SetupRoutes(app, db, debug)

	// Run Server
	log.Fatal(app.Listen(os.Getenv("APP_HOST") + ":" + os.Getenv("APP_PORT")))
}
