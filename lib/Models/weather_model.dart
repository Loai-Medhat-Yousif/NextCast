// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

class WeatherForecastModel {
  final String cityName;
  final String country;
  final int currentTemp;
  final String currentCondition;
  final int feelsLike;
  final int humidity;
  final double windSpeedKph;
  final List<ForecastDay> forecastDays;

  WeatherForecastModel({
    required this.cityName,
    required this.country,
    required this.currentTemp,
    required this.currentCondition,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeedKph,
    required this.forecastDays,
  });

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    return WeatherForecastModel(
      cityName: json['location']['name'],
      country: json['location']['country'],
      currentTemp: json['current']['temp_c'].round(),
      currentCondition: json['current']['condition']['text'],
      feelsLike: json['current']['feelslike_c'].round(),
      humidity: json['current']['humidity'],
      windSpeedKph: (json['current']['wind_kph'] as num).toDouble(),
      forecastDays: List<ForecastDay>.from(
        json['forecast']['forecastday'].map((e) => ForecastDay.fromJson(e)),
      ),
    );
  }
}
  class ForecastDay {
  final String dayName;
  final DayWeather day;
  final List<HourlyWeather> hourly;

  ForecastDay({
    required this.dayName,
    required this.day,
    required this.hourly,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    final rawDate = json['date'];
    final date = DateTime.parse(rawDate);
    final dayName = DateFormat.EEEE().format(date);

    return ForecastDay(
      dayName: dayName,
      day: DayWeather.fromJson(json['day']),
      hourly: List<HourlyWeather>.from(
        json['hour'].map((h) => HourlyWeather.fromJson(h)),
      ),
    );
  }
}

class DayWeather {
  final int maxTempC;
  final int minTempC;
  final String conditionText;
  final String condition;

  DayWeather({
    required this.maxTempC,
    required this.minTempC,
    required this.conditionText,
    required this.condition,
  });

  factory DayWeather.fromJson(Map<String, dynamic> json) {
    return DayWeather(
      maxTempC: json['maxtemp_c'].round(),
      minTempC: json['mintemp_c'].round(),
      conditionText: json['condition']['text'],
      condition: json['condition']['text'],
    );
  }
}

class HourlyWeather {
  final String time;
  final double tempC;
  final String conditionText;
  final String iconUrl;
  final double windKph;
  final int humidity;

  HourlyWeather({
    required this.time,
    required this.tempC,
    required this.conditionText,
    required this.iconUrl,
    required this.windKph,
    required this.humidity,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    return HourlyWeather(
      time: json['time'], // Example: "2025-07-26 13:00"
      tempC: json['temp_c'],
      conditionText: json['condition']['text'],
      iconUrl: "https:${json['condition']['icon']}",
      windKph: json['wind_kph'].toDouble(),
      humidity: json['humidity'],
    );
  }
}
