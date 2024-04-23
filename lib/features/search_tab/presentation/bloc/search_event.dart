part of 'search_bloc.dart';

abstract class SearchEvent {}

class SearchFilmEvent extends SearchEvent {
  SearchFilmEvent(this.searchQuery);

  String searchQuery;
}
