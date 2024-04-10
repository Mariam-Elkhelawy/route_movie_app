part of 'browse_bloc.dart';

@immutable
abstract class BrowseEvent {}
class GetMovieListEvent extends BrowseEvent {

  GetMovieListEvent();
}

