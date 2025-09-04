package middlewares

import (
	"github.com/gofiber/fiber/v2"
	"gorm.io/gorm"
)

func MiddlewareGlobal(db *gorm.DB, debug string) fiber.Handler {
	return func(c *fiber.Ctx) error {
		// fmt.Println("Setiap Request Akan Masuk Sini")
		c.Locals("DB", db)
		c.Locals("DEBUG", debug)

		return c.Next()
	}
}
