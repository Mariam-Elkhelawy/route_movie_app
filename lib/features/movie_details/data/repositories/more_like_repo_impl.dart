import 'package:dartz/dartz.dart';
import 'package:route_movie_app/core/errors/failures.dart';
import 'package:route_movie_app/features/movie_details/data/data_sources/remote/more_like_remote_ds.dart';
import 'package:route_movie_app/features/movie_details/data/models/MoreLikeModel.dart';
import 'package:route_movie_app/features/movie_details/domain/repositories/more_like_repo.dart';

class MoreLikeRepoImplement implements MoreLikeRepo {
  MoreLikeRemoteDS moreLikeRemoteDS;
  MoreLikeRepoImplement(this.moreLikeRemoteDS);
  @override
  Future<Either<Failures, MoreLikeModel>> getMoreLikeMovie(int movieId) async {
    var result = await moreLikeRemoteDS.getMoreLikeMovie(movieId);
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
