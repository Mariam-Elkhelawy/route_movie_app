import 'package:dartz/dartz.dart';
import 'package:route_movie_app/core/errors/failures.dart';
import 'package:route_movie_app/features/home_tab/data/models/PopularFilmModel.dart';
import 'package:route_movie_app/features/home_tab/data/models/RecommendedFilmModel.dart';
import 'package:route_movie_app/features/home_tab/data/models/UpComingFilmModel.dart';

abstract class HomeRepo {
  Future<Either<Failures, PopularFilmModel>> getPopularFilms();
  Future<Either<Failures, UpComingFilmModel>> getUpComingFilms();
  Future<Either<Failures, RecommendedFilmModel>> getRecommendedFilms();
}
