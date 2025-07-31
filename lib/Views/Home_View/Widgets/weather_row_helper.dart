import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nextcast/Models/weather_model.dart';
import 'package:nextcast/Theme/custom_colors.dart';

class WeatherRowHelper extends StatelessWidget {
  final WeatherForecastModel weather;
  const WeatherRowHelper({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (int i = 0; i < 3; i++)
          Column(
            children: [
              Icon(
                List.of([
                  Icons.device_thermostat_sharp,
                  Icons.cloud,
                  Icons.air,
                ])[i],
                color: CustomColors.whiteColor,
                size: 30.sp,
              ),
              Text(
                List.of(['Feels Like', 'Humidity', 'Wind Speed'])[i],
                style: TextStyle(
                  color: CustomColors.whiteColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                List.of([
                  "${weather.feelsLike}°C",
                  "${weather.humidity}%",
                  "${weather.windSpeedKph} km/h",
                ])[i],
                style: TextStyle(
                  color: CustomColors.whiteColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
