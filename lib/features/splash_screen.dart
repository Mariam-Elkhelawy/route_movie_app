import 'package:flutter/material.dart';
import 'package:route_movie_app/config/routes/app_routes_names.dart';
import 'package:route_movie_app/core/utils/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
       Navigator.pushReplacementNamed(context, AppRoutesNames.layout);
    });
    return Image.asset(
      AppImages.splash,
      fit: BoxFit.fill,
    );
  }
}
