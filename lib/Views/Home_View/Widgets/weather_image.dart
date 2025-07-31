import 'package:flutter/material.dart';

class WeatherImages extends StatelessWidget {
  final String condition;

  const WeatherImages({super.key, required this.condition});

  @override
  Widget build(BuildContext context) {
    final lower = condition.toLowerCase();

    if (lower.contains('sunny') || lower.contains('clear')) {
      return Image.asset('Assets/clear-sky.png');
    } else if (lower.contains('cloud')) {
      return Image.asset('Assets/partly-cloud.png');
    } else if (lower.contains('fog') ||
        lower.contains('mist') ||
        lower.contains('haze')) {
      return Image.asset('Assets/fog.png');
    } else if (lower.contains('snow') ||
        lower.contains('blizzard') ||
        lower.contains('ice pellets')) {
      return Image.asset('Assets/snow.png');
    } else if (lower.contains('drizzle') || lower.contains('sleet')) {
      return Image.asset('Assets/drizzle.png');
    } else if (lower.contains('rain') ||
        lower.contains('shower') ||
        lower.contains('freezing')) {
      return Image.asset('Assets/rain.png');
    } else if (lower.contains('thunder')) {
      return Image.asset('Assets/storm.png');
    } else {
      return Image.asset('Assets/clear-sky.png');
    }
  }
}
