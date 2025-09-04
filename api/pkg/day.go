package pkg

import (
	"strings"
)

// FlatDays - nama hari dalam bahasa Inggris
var FlatDays = []string{
	"MONDAY",
	"TUESDAY",
	"WEDNESDAY",
	"THURSDAY",
	"FRIDAY",
	"SATURDAY",
	"SUNDAY",
}

// Day - struct mapping nama hari Inggris ke lokal
type Day struct {
	Name  string
	Title string
}

// Days - daftar mapping hari
var Days = []Day{
	{"MONDAY", "Senin"},
	{"TUESDAY", "Selasa"},
	{"WEDNESDAY", "Rabu"},
	{"THURSDAY", "Kamis"},
	{"FRIDAY", "Jumat"},
	{"SATURDAY", "Sabtu"},
	{"SUNDAY", "Minggu"},
}

// GetTitleDay - dari nama hari Inggris ke lokal
func GetTitleDay(name string) string {
	name = strings.ToUpper(name)
	for _, d := range Days {
		if strings.ToUpper(d.Name) == name {
			return d.Title
		}
	}
	return ""
}

// GetNameDay - dari nama lokal ke nama hari Inggris
func GetNameDay(title string) string {
	title = strings.ToUpper(title)
	for _, d := range Days {
		if strings.ToUpper(d.Title) == title {
			return d.Name
		}
	}
	return ""
}
