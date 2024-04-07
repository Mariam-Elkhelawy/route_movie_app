part of 'browse_bloc.dart';



@immutable
class BrowseState {
  BrowseStatus? status;
  MovieListModel? movieList;
  Failures? failures;
  BrowseState({this.status, this.movieList, this.failures});
  BrowseState copyWith({
      BrowseStatus? status, MovieListModel? movieList, Failures? failures}) {
    return BrowseState(
      status: status ?? this.status,
      movieList: movieList ?? this.movieList,
      failures: failures ?? this.failures,
    );
  }
}

final class BrowseInitialState extends BrowseState {
  BrowseInitialState()
      : super(
          status: BrowseStatus.initial,

        );
}
