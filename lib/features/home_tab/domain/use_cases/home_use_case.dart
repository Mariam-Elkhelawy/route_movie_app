import 'package:dartz/dartz.dart';
import 'package:route_movie_app/core/errors/failures.dart';
import 'package:route_movie_app/features/home_tab/data/models/PopularFilmModel.dart';
import 'package:route_movie_app/features/home_tab/domain/repositories/home_repo.dart';

class HomeUseCase {
  HomeRepo homeRepo;

  HomeUseCase(this.homeRepo);
  Future<Either<Failures, PopularFilmModel>> call(
          PopularFilmModel popularFilmModel) =>
      homeRepo.filmSlide(popularFilmModel);
}
