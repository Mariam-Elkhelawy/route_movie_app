import 'package:dartz/dartz.dart';
import 'package:route_movie_app/core/errors/failures.dart';
import 'package:route_movie_app/features/discover_movie/data/data_sources/remote/discover_movie_ds.dart';
import 'package:route_movie_app/features/discover_movie/data/models/MovieDiscoverModel.dart';
import 'package:route_movie_app/features/discover_movie/domain/repositories/discoverMovie_repo.dart';

class DiscoverMovieRepoImplement implements DiscoverMovieRepo {
  DiscoverMovieRemoteDS discoverMovieRemoteDS;

  DiscoverMovieRepoImplement(this.discoverMovieRemoteDS);
  @override
  Future<Either<Failures, MovieDiscoverModel>> getMovieDiscoverList(
      int genreId) async {
    try {
      var result = await discoverMovieRemoteDS.getMovieDiscoverList(genreId);
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
