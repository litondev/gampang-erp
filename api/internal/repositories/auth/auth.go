package auth

import (
	"api/internal/models"
	"api/pkg"

	"gorm.io/gorm"
)

func GetUserByUsername(db *gorm.DB, username string) (*models.User, error) {
	var user models.User

	tx := db.Raw(`SELECT id, password FROM users WHERE username = ? LIMIT 1`, username).Scan(&user)

	if tx.RowsAffected == 0 {
		return nil, nil
	}

	if tx.Error != nil {
		return nil, pkg.WrapError(tx.Error)
	}

	return &user, nil
}

func GetUserByID(db *gorm.DB, id uint) (*models.User, error) {
	var user models.User

	tx := db.Raw(`SELECT id, fullname, username FROM users WHERE id = ? LIMIT 1`, id).Scan(&user)

	if tx.RowsAffected == 0 {
		return nil, nil
	}

	if tx.Error != nil {
		return nil, pkg.WrapError(tx.Error)
	}

	return &user, nil
}
