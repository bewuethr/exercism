// Package weather provides a weather forecast function.
package weather

// CurrentCondition represents the current weather.
var CurrentCondition string

// CurrentLocation stores the current location for which the forecast is made.
var CurrentLocation string

// Forecast returns a weather forecast for the provided city and condition.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
