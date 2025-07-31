import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nextcast/Controllers/Cubits/OnBoardin_Cubit/onboarding_view_cubit.dart';
import 'package:nextcast/Theme/custom_colors.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingViewCubit onBoardingCubit;
  const OnboardingContent({super.key, required this.onBoardingCubit});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: onBoardingCubit.pageController,
        onPageChanged: onBoardingCubit.onPageChanged,
        children: [
          for (var i = 0; i < 3; i++)
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      List.of([
                        'Assets/Weather.gif',
                        'Assets/Weather2.gif',
                        'Assets/Weather3.gif',
                      ])[i],
                      gaplessPlayback: true,
                      isAntiAlias: true,
                    ),
                  ),
                  20.verticalSpace,
                  Text(
                    textAlign: TextAlign.center,
                    List.of([
                      'Your World, Your Weather',
                      'Plan Your Day Ahead',
                      'Stay Alert, Stay Safe',
                    ])[i],
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: CustomColors.whiteColor,
                    ),
                  ),
                  20.verticalSpace,
                  Text(
                    textAlign: TextAlign.center,
                    List.of([
                      'Get instant, accurate forecasts for your current location and anywhere else you care about.',
                      'From a glance at your daily commute to planning a dream vacation, we\'ve got you covered.',
                      ' Dive into detailed hourly and 4-day forecasts. Our interactive radar lets you track rain, storms, and more, so you\'re always one step ahead',
                    ])[i],
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: CustomColors.whiteColor,
                    ),
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
        ],
      ),
    );
  }
}
