import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/MovieDiscoverModel.dart';
import '../repositories/discoverMovie_repo.dart';

class DiscoverMovieUseCase {
  DiscoverMovieRepo discoverMovieRepo;
  DiscoverMovieUseCase(this.discoverMovieRepo);

  Future<Either<Failures, MovieDiscoverModel>> call(int genreId) async {
    return await discoverMovieRepo.getMovieDiscoverList(genreId);
  }
}
