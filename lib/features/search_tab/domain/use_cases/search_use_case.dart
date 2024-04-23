import 'package:dartz/dartz.dart';
import 'package:route_movie_app/core/errors/failures.dart';
import 'package:route_movie_app/features/search_tab/data/models/SearchFilmModel.dart';
import 'package:route_movie_app/features/search_tab/domain/repositories/search_repo.dart';

class SearchUseCase {
  SearchRepo searchRepo;

  SearchUseCase(this.searchRepo);
  Future<Either<Failures, SearchFilmModel>> call(String searchQuery) async{
      return await searchRepo.getSearchFilms(searchQuery);}
}
