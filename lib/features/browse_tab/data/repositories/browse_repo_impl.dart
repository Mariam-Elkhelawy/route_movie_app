import 'package:dartz/dartz.dart';
import 'package:route_movie_app/core/errors/failures.dart';
import 'package:route_movie_app/features/browse_tab/data/remote/data_sources/browse_remote_ds.dart';
import 'package:route_movie_app/features/browse_tab/data/remote/models/MovieListModel.dart';
import 'package:route_movie_app/features/browse_tab/domain/repositories/browse_repo.dart';

class BrowseRepoImplement implements BrowseRepo {
  BrowseRemoteDS browseRemoteDS;
  BrowseRepoImplement(this.browseRemoteDS);
  @override
  Future<Either<Failures, MovieListModel>> getMovieList() async {
    try {
      var movieListModel = await browseRemoteDS.getMovieList();
      return Right(movieListModel);
    } catch (e) {
      return Left(
        RemoteFailures(
          e.toString(),
        ),
      );
    }
  }
}
