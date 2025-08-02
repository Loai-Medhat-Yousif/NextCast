import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

import 'package:nextcast/Controllers/Cubits/Weather_Cubits/weather_cubit.dart';
import 'package:nextcast/Services/weather_service.dart';
import 'package:nextcast/Theme/custom_colors.dart';
import 'package:nextcast/Views/Home_View/Widgets/forcast_widget.dart';
import 'package:nextcast/Views/Home_View/Widgets/hourly_forcast.dart';
import 'package:nextcast/Views/Home_View/Widgets/weather_image.dart';
import 'package:nextcast/Views/Home_View/Widgets/weather_row_helper.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherCubit(WeatherService())..fetchWeather(),
      child: Scaffold(
        body: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {
            if (state is WeatherError) {
              PanaraInfoDialog.show(
                context,
                title: "Error",
                message: state.message,
                buttonText: "Try again",
                onTapDismiss: () {
                  context.read<WeatherCubit>().fetchWeather();
                  Navigator.pop(context);
                },
                panaraDialogType: PanaraDialogType.error,
                barrierDismissible: false,
              );
            }
          },
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            } else if (state is WeatherLoaded) {
              final weather = state.weather;
              return SafeArea(
                child: RefreshIndicator(
                  backgroundColor: Colors.transparent,
                  color: CustomColors.whiteColor,
                  onRefresh: () async {
                    context.read<WeatherCubit>().fetchWeather();
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.locationDot,
                              color: Colors.white,
                              size: 30.sp,
                            ),
                            10.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  weather.cityName,
                                  style: TextStyle(
                                    color: CustomColors.whiteColor,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  weather.country,
                                  style: TextStyle(
                                    color: CustomColors.whiteColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Center(
                          child: WeatherImages(
                            condition: weather.currentCondition,
                          ),
                        ),
                        10.verticalSpace,
                        Center(
                          child: Text(
                            weather.currentCondition,
                            style: TextStyle(
                              color: CustomColors.whiteColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "${weather.currentTemp}°C",
                            style: TextStyle(
                              color: CustomColors.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 50.sp,
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        WeatherRowHelper(weather: weather),
                        20.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Forecast",
                              style: TextStyle(
                                color: CustomColors.whiteColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        20.verticalSpace,
                        ForcastWidget(weather: weather),
                        20.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Hourly Forecast",
                              style: TextStyle(
                                color: CustomColors.whiteColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        20.verticalSpace,
                        HourlyForcast(weather: weather),
                        30.verticalSpace,
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is WeatherError) {
              return const SizedBox.shrink();
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
