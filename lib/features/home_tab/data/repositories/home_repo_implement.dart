import 'package:dartz/dartz.dart';
import 'package:route_movie_app/core/errors/failures.dart';
import 'package:route_movie_app/features/home_tab/data/data_sources/remote/home_remote_ds.dart';
import 'package:route_movie_app/features/home_tab/data/models/PopularFilmModel.dart';
import 'package:route_movie_app/features/home_tab/domain/repositories/home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  HomeRemoteDS homeRemoteDS;

  HomeRepoImplementation(this.homeRemoteDS);

  @override
  Future<Either<Failures, PopularFilmModel>> filmSlide(
      PopularFilmModel popularFilm) async {
    try {
      PopularFilmModel popularFilmModel =
          await homeRemoteDS.slideFilm(popularFilm);
      return Right(popularFilmModel);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
