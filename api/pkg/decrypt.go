package pkg

import (
	"crypto/aes"
	"crypto/cipher"
	"encoding/base64"
	"errors"
)

var (
	Chiphering = "AES-128-CBC"              // hanya untuk referensi, Go pakai AES + CBC
	Iv         = []byte("1234567890123456") // IV harus 16 byte
)

// pad - PKCS7 padding untuk AES
func pad(src []byte, blockSize int) []byte {
	padding := blockSize - len(src)%blockSize
	padText := make([]byte, padding)
	for i := range padText {
		padText[i] = byte(padding)
	}
	return append(src, padText...)
}

// unpad - remove PKCS7 padding
func unpad(src []byte) ([]byte, error) {
	length := len(src)
	if length == 0 {
		return nil, errors.New("invalid padding size")
	}
	padding := int(src[length-1])
	if padding > length {
		return nil, errors.New("invalid padding size")
	}
	return src[:length-padding], nil
}

// Encrypt - enkripsi string menggunakan AES-128-CBC dan base64
func Encrypt(message string, key string) (string, error) {
	if len(key) != 16 {
		return "", errors.New("key length must be 16 bytes")
	}

	block, err := aes.NewCipher([]byte(key))
	if err != nil {
		return "", err
	}

	plaintext := pad([]byte(message), block.BlockSize())
	ciphertext := make([]byte, len(plaintext))

	mode := cipher.NewCBCEncrypter(block, Iv)
	mode.CryptBlocks(ciphertext, plaintext)

	return base64.StdEncoding.EncodeToString(ciphertext), nil
}

// Decrypt - dekripsi string AES-128-CBC dari base64
func Decrypt(encrypted string, key string) (string, error) {
	if len(key) != 16 {
		return "", errors.New("key length must be 16 bytes")
	}

	block, err := aes.NewCipher([]byte(key))
	if err != nil {
		return "", err
	}

	ciphertext, err := base64.StdEncoding.DecodeString(encrypted)
	if err != nil {
		return "", err
	}

	if len(ciphertext)%block.BlockSize() != 0 {
		return "", errors.New("ciphertext is not a multiple of the block size")
	}

	mode := cipher.NewCBCDecrypter(block, Iv)
	plaintext := make([]byte, len(ciphertext))
	mode.CryptBlocks(plaintext, ciphertext)

	plaintext, err = unpad(plaintext)
	if err != nil {
		return "", err
	}

	return string(plaintext), nil
}
