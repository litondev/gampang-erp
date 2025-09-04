package auth

import (
	"database/sql"

	"gorm.io/gorm"
)

type User struct {
	ID       uint
	Fullname string
	Username string
	Password string
}

func GetUserByUsername(db *gorm.DB, username string) (*User, error) {
	var user User
	row := db.Raw("SELECT id, password FROM users WHERE username = ? LIMIT 1", username).Row()
	err := row.Scan(&user.ID, &user.Password)
	if err != nil {
		if err == sql.ErrNoRows {
			return nil, nil // tidak ditemukan
		}
		return nil, err
	}
	return &user, nil
}

func GetUserByID(db *gorm.DB, id uint) (*User, error) {
	var user User
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
