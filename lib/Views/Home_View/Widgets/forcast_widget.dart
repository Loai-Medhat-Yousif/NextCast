// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nextcast/Models/weather_model.dart';
import 'package:nextcast/Theme/custom_colors.dart';
import 'package:nextcast/Views/Home_View/Widgets/weather_image.dart';

class ForcastWidget extends StatelessWidget {
  final WeatherForecastModel weather;
  const ForcastWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            weather.forecastDays.map((day) {
              return Container(
                width: 120.w,
                margin: REdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  color: CustomColors.secondaryColor,
                  child: Padding(
                    padding: REdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          day.dayName,
                          style: TextStyle(
                            color: CustomColors.primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        10.verticalSpace,
                        WeatherImages(condition: day.day.condition),
                        10.verticalSpace,
                        Text(
                          day.day.conditionText,
                          style: TextStyle(
                            color: CustomColors.whiteColor,
                            fontSize: 14.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        10.verticalSpace,
                        Text(
                          '${day.day.maxTempC}° / ${day.day.minTempC}°',
                          style: TextStyle(
                            color: CustomColors.whiteColor,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
