import 'package:flutter/material.dart';
import 'package:route_movie_app/config/routes/app_routes_names.dart';
import 'package:route_movie_app/core/components/reusable_components.dart';
import 'package:route_movie_app/features/layout_screen.dart';
import 'package:route_movie_app/features/movie_details/presentation/pages/movie_details_screen.dart';
import 'package:route_movie_app/features/splash_screen.dart';

class AppRoutes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesNames.splash:
        return MaterialPageRoute(
            builder: (context) => const SplashScreen(), settings: settings);
      case AppRoutesNames.layout:
        return MaterialPageRoute(
            builder: (context) => const LayoutScreen(), settings: settings);
      case AppRoutesNames.movieDetails:
        return MaterialPageRoute(
            builder: (context) => const MovieDetailsScreen(),
            settings: settings);

      default:
        return MaterialPageRoute(
          builder: (context) => unDefinedRoute(),
        );
    }
  }
}
