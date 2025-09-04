package pkg

import (
	"strings"
	"time"
)

func GetTimestamp(name string) time.Time {
	now := time.Now()

	switch name {
	case "HOUR":
		return now.Add(1 * time.Hour)
	case "DAY":
		return now.AddDate(0, 0, 1)
	case "START_OF_DAY":
		tomorrow := now.AddDate(0, 0, 1)
		return time.Date(tomorrow.Year(), tomorrow.Month(), tomorrow.Day(), 0, 0, 0, 0, tomorrow.Location())
	case "END_OF_DAY":
		tomorrow := now.AddDate(0, 0, 1)
		return time.Date(tomorrow.Year(), tomorrow.Month(), tomorrow.Day(), 23, 59, 59, int(time.Second-time.Nanosecond), tomorrow.Location())
	case "MONTH":
		return now.AddDate(0, 1, 0)
	case "START_OF_MONTH":
		nextMonth := now.AddDate(0, 1, 0)
		return time.Date(nextMonth.Year(), nextMonth.Month(), 1, 0, 0, 0, 0, nextMonth.Location())
	case "END_OF_MONTH":
		nextMonth := now.AddDate(0, 1, 0)
		// ambil tanggal 1 bulan berikutnya, lalu mundur 1 detik
		startNextNextMonth := time.Date(nextMonth.Year(), nextMonth.Month()+1, 1, 0, 0, 0, 0, nextMonth.Location())
		return startNextNextMonth.Add(-time.Second)
	case "YEAR":
		return now.AddDate(1, 0, 0)
	case "START_OF_YEAR":
		nextYear := now.AddDate(1, 0, 0)
		return time.Date(nextYear.Year(), 1, 1, 0, 0, 0, 0, nextYear.Location())
	case "END_OF_YEAR":
		nextYear := now.AddDate(1, 0, 0)
		return time.Date(nextYear.Year(), 12, 31, 23, 59, 59, 0, nextYear.Location())
	case "HALF_OF_YEAR":
		return now.AddDate(0, 6, 0)
	default:
		return now.AddDate(0, 1, 0)
	}
}

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
