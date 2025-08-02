import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              FaIcon(
                List.of([
                  FontAwesomeIcons.temperatureHalf,
                  FontAwesomeIcons.water,
                  FontAwesomeIcons.wind,
                ])[i],
                color: Colors.white,
                size: 30.sp,
              ),
              5.verticalSpace,
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
