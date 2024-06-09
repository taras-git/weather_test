enum TemperatureUnit { fahrenheit, celsius }

extension TemperatureUnitExt on TemperatureUnit {
  bool get isFahrenheit => this == TemperatureUnit.fahrenheit;
  bool get isCelsius => this == TemperatureUnit.celsius;
}
