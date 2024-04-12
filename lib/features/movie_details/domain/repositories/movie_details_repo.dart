import 'package:dartz/dartz.dart';
import 'package:route_movie_app/core/errors/failures.dart';
import 'package:route_movie_app/features/movie_details/data/models/MovieDetailsModel.dart';

abstract class MovieDetailsRepo {
  Future<Either<Failures, MovieDetailsModel>> getMovieDetails(int movieId);
}
