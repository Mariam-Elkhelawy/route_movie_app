import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/config/routes/app_routes_names.dart';
import 'package:route_movie_app/core/components/reusable_components/Container_movie.dart';
import 'package:route_movie_app/core/components/reusable_components/custom_show_dialog.dart';
import 'package:route_movie_app/core/components/reusable_components/movie_list_widget.dart';
import 'package:route_movie_app/core/enums/enums.dart';
import 'package:route_movie_app/core/firebase/firebase_functions.dart';
import 'package:route_movie_app/core/utils/app_strings.dart';
import 'package:route_movie_app/core/utils/constants.dart';
import 'package:route_movie_app/features/home_tab/data/data_sources/remote/home_remote_ds_implement.dart';
import 'package:route_movie_app/features/home_tab/data/repositories/home_repo_implement.dart';
import 'package:route_movie_app/features/home_tab/domain/use_cases/get_popular_films_use_case.dart';
import 'package:route_movie_app/features/home_tab/domain/use_cases/get_recommended_usecase.dart';
import 'package:route_movie_app/features/home_tab/domain/use_cases/get_upcoming_films_usecase.dart';
import 'package:route_movie_app/features/home_tab/presentation/bloc/home_bloc.dart';
import 'package:route_movie_app/features/home_tab/presentation/widgets/new_relase_films.dart';
import 'package:route_movie_app/features/home_tab/presentation/widgets/popular_film_widget.dart';
import 'package:route_movie_app/features/watchList_tab/data/models/watch_list_model.dart';


class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        GetPopularUseCase(
          HomeRepoImplementation(
            HomeRemoteDSImplementation(),
          ),
        ),
        GetUpComingUseCase(
          HomeRepoImplementation(
            HomeRemoteDSImplementation(),
          ),
        ),
        GetRecommendedUseCase(
          HomeRepoImplementation(
            HomeRemoteDSImplementation(),
          ),
        ),
      )
        ..add(
          HomePopularFilmEvent(),
        )
        ..add(HomeUpComingFilmEvent())
        ..add(HomeRecommendedFilmEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // if (state.screenStatus == ScreenStatus.loading) {
          //   showDialog(
          //     context: context,
          //     builder: (context) {
          //       return const AlertDialog(
          //         title: Center(
          //           child: CircularProgressIndicator(
          //             color: AppColor.primaryColor,
          //           ),
          //         ),
          //       );
          //     },
          //   );
          // }
          // else if (state.screenStatus == ScreenStatus.success) {
          //    BlocProvider.of<HomeBloc>(context).add(HomePopularFilmEvent());
          // }
          if (state.screenStatus == ScreenStatus.failure) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(AppStrings.error),
                  content: Text(state.failures?.message ?? ""),
                );
              },
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: state.popularFilmModel?.results?.length ?? 0,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      WatchListModel model = WatchListModel(
                          isWatchList: true,
                          id:
                              '${state.popularFilmModel?.results?[itemIndex].id ?? 0}',
                          title: state.popularFilmModel?.results?[itemIndex]
                                  .title ??
                              '',
                          image:
                              '${Constants.imagePath}${state.popularFilmModel?.results?[itemIndex].backdropPath ?? ''} ',
                          description: state.popularFilmModel
                                  ?.results?[itemIndex].overview ??
                              '',
                          releaseDate: state.popularFilmModel
                                  ?.results?[itemIndex].releaseDate ??
                              '',
                          movieId:
                              state.popularFilmModel?.results?[itemIndex].id ??
                                  0);

                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutesNames.movieDetails,
                              arguments: state
                                  .popularFilmModel?.results?[itemIndex].id);
                        },
                        child: PopularFilmWidget(
                          onTap: () async {
                            await FirebaseFunctions.addWatchlist(
                                watchListModel: model,
                                onException: (e) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => CustomShowDialog(
                                      dialogContent: e,
                                    ),
                                  );
                                });
                            // model.toggleBookmark();
                            // setState(() {});
                          },
                          watchListModel: model,
                          imageBackdropPath:
                              '${Constants.imagePath}${state.popularFilmModel?.results?[itemIndex].backdropPath ?? ''}',
                          imagePosterPath:
                              '${Constants.imagePath}${state.popularFilmModel?.results?[itemIndex].posterPath ?? ''} ',
                          filmDate: state.popularFilmModel?.results?[itemIndex]
                                  .releaseDate ??
                              '',
                          filmTitle: state.popularFilmModel?.results?[itemIndex]
                                  .title ??
                              '',
                        ),
                      );
                    },
                    options: CarouselOptions(
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 2),
                      autoPlayAnimationDuration: const Duration(seconds: 2),
                      // autoPlayCurve: Curves.easeInBack,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 85.h),
                    child: ContainerMovie(
                      text: AppStrings.newReleases,
                      height: 186.h,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          WatchListModel model = WatchListModel(
                              isWatchList: true,
                              id:
                                  '${state.upComingFilmModel?.results?[index].id ?? 0}',
                              title: state.upComingFilmModel?.results?[index]
                                      .title ??
                                  '',
                              image:
                                  '${Constants.imagePath}${state.upComingFilmModel?.results?[index].backdropPath ?? ''} ',
                              description: state.upComingFilmModel
                                      ?.results?[index].overview ??
                                  '',
                              releaseDate: state.upComingFilmModel
                                      ?.results?[index].releaseDate ??
                                  '',
                              movieId:
                                  state.upComingFilmModel?.results?[index].id ??
                                      0);
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutesNames.movieDetails,
                                  arguments: state
                                      .upComingFilmModel?.results?[index].id);
                            },
                            child: NewReleasesFilms(
                              watchListModel: model,
                              onTap: () async {
                                await FirebaseFunctions.addWatchlist(
                                    watchListModel: model,
                                    onException: (e) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => CustomShowDialog(
                                          dialogContent: e,
                                        ),
                                      );
                                    });
                                // model.toggleBookmark();
                                // setState(() {});
                              },
                              filmImage:
                                  '${Constants.imagePath}${state.upComingFilmModel?.results?[index].posterPath ?? ''} ',
                            ),
                          );
                        },
                        itemCount:
                            state.upComingFilmModel?.results?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 12.w,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  // ContainerMovie(
                  //   height: 246.h,
                  //   text: AppStrings.recommended,
                  //   child: ListView.separated(
                  //     itemCount:
                  //         state.recommendedFilmModel?.results?.length ?? 0,
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (context, index) {
                  //       return MovieListWidget(
                  //         onClicked: () async {
                  //           WatchListModel model = WatchListModel(
                  //               isWatchList: true,
                  //               id:
                  //                   '${state.recommendedFilmModel?.results?[index].id ?? 0}',
                  //               title: state.recommendedFilmModel
                  //                       ?.results?[index].title ??
                  //                   '',
                  //               image:
                  //                   '${Constants.imagePath}${state.recommendedFilmModel?.results?[index].backdropPath ?? ''} ',
                  //               description: state.recommendedFilmModel
                  //                       ?.results?[index].overview ??
                  //                   '',
                  //               releaseDate: state.recommendedFilmModel
                  //                       ?.results?[index].releaseDate ??
                  //                   '',
                  //               movieId: state.recommendedFilmModel
                  //                       ?.results?[index].id ??
                  //                   0);
                  //           await FirebaseFunctions.addWatchlist(
                  //               watchListModel: model,
                  //               onException: (e) {
                  //                 showDialog(
                  //                   context: context,
                  //                   builder: (context) => CustomShowDialog(
                  //                     dialogContent: e,
                  //                   ),
                  //                 );
                  //               });
                  //         },
                  //         imageUrl:
                  //             "${Constants.imagePath}${state.recommendedFilmModel?.results?[index].posterPath ?? ""}",
                  //         voteAverage:
                  //             "${state.recommendedFilmModel?.results?[index].voteAverage ?? 0.toStringAsFixed(2)}",
                  //         movieTitle: state.recommendedFilmModel
                  //                 ?.results?[index].title ??
                  //             "",
                  //         releaseDate: state.recommendedFilmModel
                  //                 ?.results?[index].releaseDate ??
                  //             "",
                  //         onTap: () {
                  //           Navigator.pushNamed(
                  //             context,
                  //             AppRoutesNames.movieDetails,
                  //             arguments: state.recommendedFilmModel
                  //                     ?.results?[index].id ??
                  //                 0,
                  //           );
                  //         },
                  //       );
                  //     },
                  //     separatorBuilder: (context, index) {
                  //       return SizedBox(
                  //         width: 14.w,
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
