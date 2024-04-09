import 'package:route_movie_app/features/search_tab/data/models/SearchFilmModel.dart';

abstract class SearchRemoteDs{
  Future<SearchFilmModel> getSearchFilms(String searchQuery);
}