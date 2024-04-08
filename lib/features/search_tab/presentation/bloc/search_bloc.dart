import 'package:bloc/bloc.dart';
import 'package:route_movie_app/core/enums/enums.dart';
import 'package:route_movie_app/core/errors/failures.dart';
import 'package:route_movie_app/features/search_tab/data/models/SearchFilmModel.dart';
import 'package:route_movie_app/features/search_tab/domain/use_cases/search_use_case.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchUseCase searchUseCase;
  SearchBloc(this.searchUseCase) : super(SearchInitialState()) {
    on<SearchFilmEvent>((event, emit) async {
      emit(state.copyWith(screenStatus: ScreenStatus.loading));
      var result = await searchUseCase.call(event.searchQuery);

      result.fold((l) {
        emit(state.copyWith(screenStatus: ScreenStatus.failure, failures: l));
      }, (r) {
        emit(state.copyWith(
            screenStatus: ScreenStatus.success, searchFilmModel: r));
      });
    });
  }
}
