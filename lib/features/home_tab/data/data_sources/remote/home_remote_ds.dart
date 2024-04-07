import 'package:route_movie_app/features/home_tab/data/models/PopularFilmModel.dart';

abstract class HomeRemoteDS {
  Future<PopularFilmModel> getPopularFilms();
}
