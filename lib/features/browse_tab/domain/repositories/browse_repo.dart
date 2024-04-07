import 'package:dartz/dartz.dart';
import 'package:route_movie_app/core/errors/failures.dart';

import '../../data/remote/models/MovieListModel.dart';

abstract class BrowseRepo {
  Future<Either<Failures, MovieListModel>> getMovieList(List<Genres>? genres);
}
