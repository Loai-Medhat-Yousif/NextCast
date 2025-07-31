import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextcast/Controllers/Cubits/OnBoardin_Cubit/onboarding_view_cubit.dart';
import 'package:nextcast/Theme/custom_colors.dart';
import 'package:nextcast/Views/Home_View/home_view.dart';
import 'package:nextcast/Views/OnBoarding_View/Widgets/onboarding_content.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingViewCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<OnboardingViewCubit, OnboardingViewState>(
            builder: (context, state) {
              final onBoardingCubit = context.read<OnboardingViewCubit>();
              return Column(
                children: [
                  20.verticalSpace,
                  Center(
                    child: SmoothPageIndicator(
                      controller: onBoardingCubit.pageController,
                      count: 3,
                      effect: SwapEffect(
                        activeDotColor: CustomColors.secondaryColor,
                        dotColor: CustomColors.whiteColor,
                        dotHeight: 0.015.sh,
                        dotWidth: 0.2.sw,
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  OnboardingContent(onBoardingCubit: onBoardingCubit),
                  ElevatedButton(
                    onPressed: () {
                      onBoardingCubit.islastpage
                          ? {
                            onBoardingCubit.finishOnboarding(),
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeView(),
                              ),
                            ),
                          }
                          : onBoardingCubit.nextPage();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      minimumSize: Size(250.w, 50.h),
                    ),
                    child: Text(
                      onBoardingCubit.islastpage ? 'Get Started' : 'Next',
                      style: TextStyle(
                        fontSize: 25.sp,
                        color: CustomColors.primaryColor,
                      ),
                    ),
                  ),
                  20.verticalSpace,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
