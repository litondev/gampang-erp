package auth

import (
	repository "api/internal/repositories/auth"
	"api/pkg" // untuk CheckPasswordHash
	"errors"
	"time"

	"github.com/golang-jwt/jwt/v4"
	"gorm.io/gorm"
)

func LoginService(db *gorm.DB, username, password string) (string, error) {
	user, err := repository.GetUserByUsername(db, username)
	if err != nil {
		return "", err
	}
	if user == nil {
		return "", errors.New("username atau password salah")
	}

	if !pkg.CheckPasswordHash(password, user.Password) {
		return "", errors.New("username atau password salah")
	}

	claims := jwt.MapClaims{
		"id":  user.ID,
		"exp": time.Now().Add(time.Hour * 1).Unix(),
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	accessToken, err := token.SignedString([]byte("secret"))
	if err != nil {
		return "", err
	}

	return accessToken, nil
}

func MeService(db *gorm.DB, id uint) (*repository.User, error) {
	user, err := repository.GetUserByID(db, id)
	if err != nil {
		return nil, err
	}
	if user == nil {
		return nil, errors.New("pengguna tidak ditemukan")
	}
	return user, nil
}
