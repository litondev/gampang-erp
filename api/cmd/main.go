package main

import (
	"api/config"
	"api/internal/routes"
	"fmt"
	"log"
	"os"
	"strconv"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/joho/godotenv"
)

func main() {
	// Load Env
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	// Load Db
	db, errDb := config.Database()

	if errDb != nil {
		fmt.Println(errDb)
		os.Exit(1)
	}

	// Debug
	debug := os.Getenv("APP_DEBUG")

	appDebug, errDebug := strconv.ParseBool(debug)
	if errDebug != nil {
		fmt.Println(errDebug)
		os.Exit(1)
	}

	// Init Fiber
	app := fiber.New(fiber.Config{
		ErrorHandler: func(ctx *fiber.Ctx, err error) error {
			code := fiber.StatusInternalServerError

			if e, ok := err.(*fiber.Error); ok {
				code = e.Code
			}

			logFile, logFileError := os.OpenFile(os.Getenv("APP_LOGGER_LOCATION"), os.O_APPEND|os.O_WRONLY|os.O_CREATE, 0600)

			if logFileError != nil {
				ctx.Status(500).JSON(fiber.Map{
					"message": "Terjadi Kesalahan",
				})
			}

			logger := log.New(logFile, "Error : ", log.LstdFlags)

			logger.Println(time.Now().String())

			logger.Println(err.Error())

			fmt.Println(err.Error())

			var message string = "Terjadi Kesalahan"

			if appDebug == true {
				message = err.Error()
			}

			err = ctx.Status(code).JSON(fiber.Map{
				"message": message,
				"code":    code,
			})

			if err != nil {
				return ctx.Status(fiber.StatusInternalServerError).JSON(fiber.Map{
					"message": "Terjadi Kesalahan",
				})
			}

			return ctx.Status(500).JSON(fiber.Map{
				"message": "Terjadi Kesalahan",
			})
		},
	})

	// Setup Routes
	routes.SetupRoutes(app, db, debug)

	// Run Server
	log.Fatal(app.Listen(os.Getenv("APP_HOST") + ":" + os.Getenv("APP_PORT")))
}
