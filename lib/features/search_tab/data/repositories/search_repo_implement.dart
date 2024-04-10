import 'package:dartz/dartz.dart';
import 'package:route_movie_app/core/errors/failures.dart';
import 'package:route_movie_app/features/search_tab/data/data_sources/remote/search_remote_ds.dart';
import 'package:route_movie_app/features/search_tab/data/models/SearchFilmModel.dart';
import 'package:route_movie_app/features/search_tab/domain/repositories/search_repo.dart';

class SearchRepoImplementation implements SearchRepo{
  SearchRemoteDs searchRemoteDs;

  SearchRepoImplementation(this.searchRemoteDs);

  @override
  Future<Either<Failures, SearchFilmModel>> getSearchFilms(String searchQuery) async{
    try{
      SearchFilmModel searchFilmModel = await searchRemoteDs.getSearchFilms(searchQuery);
      return Right(searchFilmModel);
    }
    catch (e) {
      return Left(
        RemoteFailures(
          e.toString(),
        ),
      );
    }
  }
}