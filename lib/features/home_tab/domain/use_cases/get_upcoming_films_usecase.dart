import 'package:dartz/dartz.dart';
import 'package:route_movie_app/core/errors/failures.dart';
import 'package:route_movie_app/features/home_tab/data/models/UpComingFilmModel.dart';
import 'package:route_movie_app/features/home_tab/domain/repositories/home_repo.dart';

class GetUpComingUseCase{
  HomeRepo homeRepo;

  GetUpComingUseCase(this.homeRepo);
  Future<Either<Failures, UpComingFilmModel>> call() =>
      homeRepo.getUpComingFilms();
}