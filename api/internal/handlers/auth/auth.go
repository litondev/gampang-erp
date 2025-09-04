package auth

import (
	"fmt"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
	"gorm.io/gorm"

	service "api/internal/services/auth"
)

func Login(c *fiber.Ctx) error {
	db := c.Locals("DB").(*gorm.DB)

	body := struct {
		Username string `json:"username" form:"username"`
		Password string `json:"password" form:"password"`
	}{}

	if err := c.BodyParser(&body); err != nil {
		fmt.Println("Error:", err)
		return c.Status(400).JSON(fiber.Map{"message": "Terjadi kesalahan"})
	}

	token, err := service.LoginService(db, body.Username, body.Password)
	if err != nil {
		return c.Status(401).JSON(fiber.Map{"message": err.Error()})
	}

	return c.Status(200).JSON(fiber.Map{"token": token})
}

func Me(c *fiber.Ctx) error {
	db := c.Locals("DB").(*gorm.DB)

	userToken := c.Locals("user").(*jwt.Token)
	claims := userToken.Claims.(jwt.MapClaims)

	idFloat := claims["id"].(float64)
	id := uint(idFloat)

	user, err := service.MeService(db, id)
	if err != nil {
		return c.Status(404).JSON(fiber.Map{"message": err.Error()})
	}

	return c.Status(200).JSON(user)
}

func Logout(c *fiber.Ctx) error {
	return c.Status(200).JSON(fiber.Map{
		"message": "success",
	})
}

func RefreshToken(c *fiber.Ctx) error {
	user := c.Locals("user").(*jwt.Token)

	claimHeaders := user.Claims.(jwt.MapClaims)

	id := claimHeaders["id"].(float64)

	claims := jwt.MapClaims{
		"id":  id,
		"exp": time.Now().Add(time.Hour * 1).Unix(),
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)

	access_token, errSigned := token.SignedString([]byte("secret"))

	if errSigned != nil {
		return c.Status(401).JSON(fiber.Map{
			"message": "Terjadi Kesalahan",
		})
	}

	return c.Status(200).JSON(fiber.Map{
		"token": access_token,
	})
}
