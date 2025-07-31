import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextcast/Views/Home_View/home_view.dart';
import 'package:nextcast/Views/OnBoarding_View/onboarding_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      final pref = await SharedPreferences.getInstance();
      pref.getBool('ShowHome');
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:
                (context) =>
                    pref.getBool('ShowHome') ?? false
                        ? const HomeView()
                        : const OnboardingView(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('Assets/LogoNoBg.png', width: 300.w, height: 300.h),
      ),
    );
  }
}
