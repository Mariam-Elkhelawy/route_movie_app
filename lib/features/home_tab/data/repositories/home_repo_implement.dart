import 'package:dartz/dartz.dart';
import 'package:route_movie_app/core/errors/failures.dart';
import 'package:route_movie_app/features/home_tab/data/data_sources/remote/home_remote_ds.dart';
import 'package:route_movie_app/features/home_tab/data/models/PopularFilmModel.dart';
import 'package:route_movie_app/features/home_tab/data/models/RecommendedFilmModel.dart';
import 'package:route_movie_app/features/home_tab/data/models/UpComingFilmModel.dart';
import 'package:route_movie_app/features/home_tab/domain/repositories/home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  HomeRemoteDS homeRemoteDS;

  HomeRepoImplementation(this.homeRemoteDS);

  @override
  Future<Either<Failures, PopularFilmModel>> getPopularFilms() async {
    try {
      PopularFilmModel popularFilmModel = await homeRemoteDS.getPopularFilms();
      return Right(popularFilmModel);
    } catch (e) {
      return Left(
        RemoteFailures(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failures, UpComingFilmModel>> getUpComingFilms() async {
    try {
      UpComingFilmModel upComingFilmModel =
          await homeRemoteDS.getUpComingFilms();
      return Right(upComingFilmModel);
    } catch (e) {
      return Left(
        RemoteFailures(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failures, RecommendedFilmModel>> getRecommendedFilms()async {
    try {
      RecommendedFilmModel recommendedFilmModel =
          await homeRemoteDS.getRecommendedFilms();
      return Right(recommendedFilmModel);
    } catch (e) {
      return Left(
        RemoteFailures(
          e.toString(),
        ),
      );
    }
  }
}
