import 'package:dartz/dartz.dart';
import 'package:route_movie_app/core/errors/failures.dart';
import 'package:route_movie_app/features/movie_details/data/data_sources/remote/movie_details_remote_ds.dart';
import 'package:route_movie_app/features/movie_details/data/models/MovieDetailsModel.dart';
import 'package:route_movie_app/features/movie_details/domain/repositories/movie_details_repo.dart';

class MovieDetailsRepoImplement implements MovieDetailsRepo {
  MovieDetailsRemoteDS movieDetailsRemoteDS;
  MovieDetailsRepoImplement(this.movieDetailsRemoteDS);
  @override
  Future<Either<Failures, MovieDetailsModel>> getMovieDetails(
      int movieId) async {
    var result = await movieDetailsRemoteDS.getMovieDetails(movieId);
    try {
      return Right(result);
    } catch (e) {
      return Left(
        RemoteFailures(
          e.toString(),
        ),
      );
    }
  }
}
