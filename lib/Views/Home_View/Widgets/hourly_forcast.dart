import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nextcast/Models/weather_model.dart';
import 'package:nextcast/Theme/custom_colors.dart';
import 'package:nextcast/Views/Home_View/Widgets/weather_image.dart';

class HourlyForcast extends StatelessWidget {
  final WeatherForecastModel weather;
  const HourlyForcast({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            weather.forecastDays.first.hourly.map((hour) {
              final timeOnly = hour.time.split(" ").last;
              return Container(
                width: 90.w,
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: CustomColors.secondaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    Text(
                      timeOnly,
                      style: TextStyle(
                        color: CustomColors.primaryColor,
                        fontSize: 12.sp,
                      ),
                    ),
                    5.verticalSpace,
                    WeatherImages(condition: hour.conditionText),
                    5.verticalSpace,
                    Text(
                      '${hour.tempC.round()}°C',
                      style: TextStyle(
                        color: CustomColors.whiteColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}
