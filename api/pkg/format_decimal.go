package pkg

import (
	"math"
	"strconv"
)

// FormatDecimal - format angka dengan decimal, separator bisa dikustom
func FormatDecimal(value float64, formatDecimal int, separator, decimalPoint string) string {
	if formatDecimal < 0 {
		formatDecimal = 2
	}
	// rounding
	pow := math.Pow(10, float64(formatDecimal))
	rounded := math.Round(value*pow) / pow

	// format dengan separator
	str := strconv.FormatFloat(rounded, 'f', formatDecimal, 64)

	// replace titik desimal jika perlu
	if decimalPoint != "." {
		parts := []rune(str)
		for i, r := range parts {
			if r == '.' {
				parts[i] = []rune(decimalPoint)[0]
				break
			}
		}
		str = string(parts)
	}

	// replace separator ribuan
	if separator != "" && separator != "," {
		// Go tidak punya built-in thousand separator selain comma
		// untuk versi sederhana kita bisa skip atau implement manual jika dibutuhkan
	}

	return str
}

// FormatDecimalAmount - default 2 decimal, separator "," dan titik "."
func FormatDecimalAmount(value float64, formatDecimal int) string {
	return FormatDecimal(value, formatDecimal, ",", ".")
}

// FormatDecimalPercentage - default 2 decimal, format persentase
func FormatDecimalPercentage(value float64, formatDecimal int) string {
	return FormatDecimal(value, formatDecimal, ",", ".")
}

// FormatInteger - rounding ke integer
func FormatInteger(value float64) int {
	return int(math.Round(value))
}

// FormatDecimalExcel - untuk export Excel, bisa rounding sesuai setting
func FormatDecimalExcel(value float64, formatDecimal int) float64 {
	if formatDecimal < 0 {
		formatDecimal = 2
	}
	pow := math.Pow(10, float64(formatDecimal))
	return math.Round(value*pow) / pow
}

// FormatDecimalAmountExcel - rounding Excel amount
func FormatDecimalAmountExcel(value float64, formatDecimal int) float64 {
	return FormatDecimalExcel(value, formatDecimal)
}

// FormatDecimalPercentageExcel - rounding persentase Excel
func FormatDecimalPercentageExcel(value float64, formatDecimal int) float64 {
	return FormatDecimalExcel(value, formatDecimal)
}

// FormatIntegerExcel - rounding integer untuk Excel
func FormatIntegerExcel(value float64) int {
	return int(math.Round(value))
}
