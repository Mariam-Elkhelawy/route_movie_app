import 'package:dartz/dartz.dart';
import 'package:route_movie_app/core/errors/failures.dart';
import 'package:route_movie_app/features/home_tab/data/models/RecommendedFilmModel.dart';
import 'package:route_movie_app/features/home_tab/domain/repositories/home_repo.dart';

class GetRecommendedUseCase{
  HomeRepo homeRepo;

  GetRecommendedUseCase(this.homeRepo);
  Future<Either<Failures, RecommendedFilmModel>> call() =>
      homeRepo.getRecommendedFilms();
}