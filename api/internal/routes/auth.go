package routes

import (
	"api/internal/handlers/auth"

	"github.com/gofiber/fiber/v2"
)

func setupAuth(api fiber.Router) {
	api.Post("/refresh-token", auth.RefreshToken)
	api.Post("/logout", auth.Logout)
	api.Get("/me", auth.Me)
}
