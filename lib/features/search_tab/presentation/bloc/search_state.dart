part of 'search_bloc.dart';


class SearchState {
  ScreenStatus? screenStatus;
SearchFilmModel?
searchFilmModel;
  Failures? failures;

  SearchState({this.screenStatus, this.searchFilmModel, this.failures});
  SearchState copyWith(
      {ScreenStatus? screenStatus,
      SearchFilmModel? searchFilmModel,
      Failures? failures}) {
    return SearchState(
        screenStatus: screenStatus ?? this.screenStatus,
        searchFilmModel: searchFilmModel ?? this.searchFilmModel,
        failures: failures ?? this.failures);
  }
}

final class SearchInitialState extends SearchState {
  SearchInitialState(): super(screenStatus: ScreenStatus.initial);
}
