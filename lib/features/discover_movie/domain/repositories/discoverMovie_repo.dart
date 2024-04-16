import 'package:dartz/dartz.dart';
import 'package:route_movie_app/core/errors/failures.dart';

import '../../data/models/MovieDiscoverModel.dart';

abstract class DiscoverMovieRepo {
  Future<Either<Failures, MovieDiscoverModel>> getMovieDiscoverList(
      int genreId);
}
