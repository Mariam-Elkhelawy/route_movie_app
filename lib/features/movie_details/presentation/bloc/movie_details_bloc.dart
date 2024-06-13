import 'package:bloc/bloc.dart';
import 'package:route_movie_app/features/movie_details/data/models/MovieDetailsModel.dart';

import '../../../../core/enums/enums.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/MoreLikeModel.dart';
import '../../domain/use_cases/more_like_use_case.dart';
import '../../domain/use_cases/movie_details_use_case.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsUseCase movieDetailsUseCase;
  MoreLikeUseCase moreLikeUseCase;
  MovieDetailsBloc(this.movieDetailsUseCase, this.moreLikeUseCase)
      : super(MovieDetailsInitialState()) {
    on<GetMovieDetailsEvent>((event, emit) async {
      emit(state.copyWith(status: ScreenStatus.loading));
      var result = await movieDetailsUseCase.call(event.movieId);
      result.fold((l) {
        emit(
          state.copyWith(status: ScreenStatus.failure, failures: l),
        );
      }, (r) {
        emit(
          state.copyWith(status: ScreenStatus.success, movieDetailsModel: r),
        );
      });
    });
    on<MoreLikeMovieEvent>((event, emit) async {
      emit(state.copyWith(status: ScreenStatus.loading));
      var result = await moreLikeUseCase.call(event.movieId);
      result.fold((l) {
        emit(
          state.copyWith(status: ScreenStatus.failure, failures: l),
        );
      }, (r) {
        emit(
          state.copyWith(status: ScreenStatus.success, moreLikeModel: r),
        );
      });
    });
  }
}
