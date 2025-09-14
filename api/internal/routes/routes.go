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

	// ASSET MIDDLEWARE
	app.Static("/assets", "./assets")

	// GROUP API
	api := app.Group("/api")

	// STATUS
	api.Get("/status", func(c *fiber.Ctx) error {
		return c.Status(200).JSON(fiber.Map{
			"message": "active",
		})
	})

	// LOGIN
	api.Post("/login", auth.Login)

	// api.Get("/get-setting");
	// api.Get("/get-user");
	// api.Get("/get-customer");
	// api.Get("/get-supplier");
	// api.Get("/get-customer-group");
	// api.Get("/get-all-customer-group");
	// api.Get("/get-seller");
	// api.Get("/get-area");
	// api.Get("/get-item");
	// api.Get("/get-item-pc");
	// api.Get("/get-item-identity")
	// api.Get("/get-item-price");
	// api.Get("/get-item-catgorey");
	// api.Get("/get-production-division");
	// api.Get("/get-chart-of-account");
	// api.Get("/get-all-chart-of-account");
	// api.Get("/get-qrcode");
	// api.Get("/get-barcode");
	// api.Get("/get-warehouse");
	// api.Get("/show-supplier");
	// api.Get("/show-customer");
	// api.Get("/show-user");
	// api.Get("/show-warehouse");
	// api.Get("/get-promotion");
	// api.Get("/get-promotion-item");

	// JWT MIDDLEWARE
	app.Use(jwtware.New(jwtware.Config{
		SigningKey: []byte("secret"),
		ErrorHandler: func(c *fiber.Ctx, err error) error {
			return c.Status(fiber.StatusUnauthorized).JSON(fiber.Map{
				"message": "Token tidak valid",
			})
		},
	}))

	setupAuth(api)
	// setupFinance(api)
	// setupMarketing(api)
	// setupMaster(api)
	// setupProfil(api)
	// setupReport(api)
	// setupSellingModule(api)
	// setupPurchaseingModule(api)
	// setupSetting(api)
	// setupInventory(api)
	// setupManufactur(api)
	// setupDepreciation(api)
}
