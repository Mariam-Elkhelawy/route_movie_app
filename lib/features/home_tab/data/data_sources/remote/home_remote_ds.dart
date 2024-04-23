import 'package:route_movie_app/features/home_tab/data/models/PopularFilmModel.dart';
import 'package:route_movie_app/features/home_tab/data/models/RecommendedFilmModel.dart';
import 'package:route_movie_app/features/home_tab/data/models/UpComingFilmModel.dart';

abstract class HomeRemoteDS {
  Future<PopularFilmModel> getPopularFilms();
   Future<UpComingFilmModel> getUpComingFilms();
   Future<RecommendedFilmModel> getRecommendedFilms();
}
