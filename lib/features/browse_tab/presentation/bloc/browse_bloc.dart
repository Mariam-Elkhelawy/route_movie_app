import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_movie_app/core/errors/failures.dart';

import '../../../../core/enums/enums.dart';
import '../../data/remote/models/MovieListModel.dart';
import '../../domain/use_cases/browse_use_case.dart';

part 'browse_event.dart';
part 'browse_state.dart';

class BrowseBloc extends Bloc<BrowseEvent, BrowseState> {
  BrowseUseCase browseUseCase;
  BrowseBloc(this.browseUseCase) : super(BrowseInitialState()) {
    on<BrowseEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetMovieListEvent>((event , emit)async{
      emit(state.copyWith(status: ScreenStatus.loading));
      var result = await browseUseCase.call(event.genres);
      result.fold((l) {
        emit(state.copyWith(status: ScreenStatus.failure, failures: l));
      }, (r) {
        emit(state.copyWith(status: ScreenStatus.success, movieList: r));
      } );

    });
  }
}
