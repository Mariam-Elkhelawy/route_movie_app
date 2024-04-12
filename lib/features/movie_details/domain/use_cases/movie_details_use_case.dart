import 'package:dartz/dartz.dart';
import 'package:route_movie_app/features/movie_details/domain/repositories/movie_details_repo.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/MovieDetailsModel.dart';

class MovieDetailsUseCase {
  MovieDetailsRepo movieDetailsRepo;
  MovieDetailsUseCase(this.movieDetailsRepo);
  Future<Either<Failures, MovieDetailsModel>> call(int movieId) async {
    return await movieDetailsRepo.getMovieDetails(movieId);
  }
}
