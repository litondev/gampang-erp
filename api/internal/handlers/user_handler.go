package handlers

import "github.com/gofiber/fiber/v2"

func GetUsers(c *fiber.Ctx) error {
	return c.JSON(fiber.Map{
		"status": "success",
		"data":   []string{"John", "Jane"},
	})
}
