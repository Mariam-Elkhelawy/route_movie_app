import 'package:dartz/dartz.dart';
import 'package:route_movie_app/features/movie_details/domain/repositories/more_like_repo.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/MoreLikeModel.dart';

class MoreLikeUseCase {
  MoreLikeRepo moreLikeRepo;
  MoreLikeUseCase(this.moreLikeRepo);
  Future<Either<Failures, MoreLikeModel>> call(int movieId) async {
    return await moreLikeRepo.getMoreLikeMovie(movieId);
  }
}
