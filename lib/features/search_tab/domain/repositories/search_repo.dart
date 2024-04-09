import 'package:dartz/dartz.dart';
import 'package:route_movie_app/core/errors/failures.dart';
import 'package:route_movie_app/features/search_tab/data/models/SearchFilmModel.dart';

abstract class SearchRepo{
  Future<Either<Failures,SearchFilmModel>> getSearchFilms(String searchQuery);
}