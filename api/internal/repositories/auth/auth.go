package auth

import (
	"api/internal/models"
	"database/sql"

	"gorm.io/gorm"
)

func GetUserByUsername(db *gorm.DB, username string) (*models.User, error) {
	var user models.User
	row := db.Raw("SELECT id, password FROM users WHERE username = ? LIMIT 1", username).Row()
	err := row.Scan(&user.ID, &user.Password)
	if err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}
	return &user, nil
}

func GetUserByID(db *gorm.DB, id uint) (*models.User, error) {
	var user models.User
	row := db.Raw("SELECT id, fullname, username FROM users WHERE id = ? LIMIT 1", id).Row()
	err := row.Scan(&user.ID, &user.Fullname, &user.Username)
	if err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}
	return &user, nil
}
