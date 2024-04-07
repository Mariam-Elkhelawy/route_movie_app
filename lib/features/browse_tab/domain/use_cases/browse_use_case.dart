import 'package:dartz/dartz.dart';
import 'package:route_movie_app/core/errors/failures.dart';
import 'package:route_movie_app/features/browse_tab/domain/repositories/browse_repo.dart';

import '../../data/remote/models/MovieListModel.dart';

class BrowseUseCase {
  BrowseRepo repo;
  BrowseUseCase(this.repo);
  Future<Either<Failures, MovieListModel>> call(List<Genres>? genres) {
    return repo.getMovieList(genres);
  }
}
