import 'package:dartz/dartz.dart';
import 'package:route_movie_app/core/errors/failures.dart';
import 'package:route_movie_app/features/home_tab/data/models/PopularFilmModel.dart';

abstract class HomeRepo{
 Future<Either<Failures,PopularFilmModel>> filmSlide(
     PopularFilmModel popularFilmModel
     );
}