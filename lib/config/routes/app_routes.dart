import 'package:flutter/material.dart';
import 'package:route_movie_app/config/routes/app_routes_names.dart';
import 'package:route_movie_app/core/components/reusable_components.dart';
import 'package:route_movie_app/features/discover_movie/presentation/pages/discover_movie_page.dart';
import 'package:route_movie_app/features/layout_screen.dart';
import 'package:route_movie_app/features/splash_screen.dart';

class AppRoutes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesNames.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
      case AppRoutesNames.layout:
        return MaterialPageRoute(
          builder: (context) => LayoutScreen(),
          settings: settings,
        );
      case AppRoutesNames.discoverMovie:
        return MaterialPageRoute(
          builder: (context) => DiscoverMoviePage(),
          settings: settings,

        );

      default:
        return MaterialPageRoute(
          builder: (context) => unDefinedRoute(),
        );
    }
  }
}
