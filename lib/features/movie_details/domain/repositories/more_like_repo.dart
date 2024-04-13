import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/MoreLikeModel.dart';

abstract class MoreLikeRepo {
  Future<Either<Failures, MoreLikeModel>> getMoreLikeMovie(int movieId);
}
