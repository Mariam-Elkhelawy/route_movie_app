import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/core/components/reusable_components/Container_movie.dart';
import 'package:route_movie_app/core/components/reusable_components/movie_list_widget.dart';
import 'package:route_movie_app/core/utils/app_colors.dart';
import 'package:route_movie_app/features/movie_details/data/data_sources/remote/more_like_remote_ds_impl.dart';
import 'package:route_movie_app/features/movie_details/data/data_sources/remote/movie_details_remote_ds_impl.dart';
import 'package:route_movie_app/features/movie_details/data/repositories/more_like_repo_impl.dart';
import 'package:route_movie_app/features/movie_details/data/repositories/movie_details_repo_impl.dart';
import 'package:route_movie_app/features/movie_details/domain/use_cases/more_like_use_case.dart';
import 'package:route_movie_app/features/movie_details/domain/use_cases/movie_details_use_case.dart';
import '../../../../config/routes/app_routes_names.dart';
import '../../../../core/enums/enums.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/styles.dart';
import '../bloc/movie_details_bloc.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final int movieId = ModalRoute.of(context)!.settings.arguments as int;
    return BlocProvider(
      create: (context) => MovieDetailsBloc(
        MovieDetailsUseCase(
          MovieDetailsRepoImplement(
            MovieDetailsRemoteDSImpl(),
          ),
        ),
        MoreLikeUseCase(
          MoreLikeRepoImplement(
            MoreLikeRemoteDsImplement(),
          ),
        ),
      )
        ..add(
          GetMovieDetailsEvent(movieId),
        )
        ..add(
          MoreLikeMovieEvent(movieId),
        ),
      child: BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
        listener: (context, state) {
          /* if (state.status == ScreenStatus.loading) {
            showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          }*/
          if (state.status == ScreenStatus.failure) {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: AlertDialog(
                  title: const Text(AppStrings.error),
                  content: Text(
                    state.failures?.message ?? AppStrings.wrong,
                  ),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                state.movieDetailsModel?.title ?? "",
                style: AppStyles.titleAppBar,
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CachedNetworkImage(
                      width: 412.w,
                      height: 217.h,
                      fit: BoxFit.cover,
                      imageUrl:
                          '${Constants.imagePath}${state.movieDetailsModel?.backdropPath ?? ""}',
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    Icon(
                      Icons.play_circle_filled_outlined,
                      color: AppColor.whiteColor,
                      size: 60.w,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.w, top: 13.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.movieDetailsModel?.title ?? "",
                        style: AppStyles.bodyMedium.copyWith(
                          fontSize: 18,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        state.movieDetailsModel?.releaseDate ?? "",
                        style: AppStyles.dateSmall,
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              CachedNetworkImage(
                                width: 129.w,
                                height: 210.h,
                                fit: BoxFit.fill,
                                imageUrl:
                                    '${Constants.imagePath}${state.movieDetailsModel?.posterPath ?? ""}',
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                  child: CircularProgressIndicator(
                                    value: downloadProgress.progress,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              Positioned(
                                left: -2,
                                child: Image.asset(
                                  AppImages.icBookmark,
                                  width: 27.w,
                                  height: 36.h,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 11.w),
                          Expanded(
                            child: SizedBox(
                              width: 250.w,
                              height: 220.h,
                              child: Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 9.w,
                                          mainAxisSpacing: 7.h,
                                          childAspectRatio: 3,
                                        ),
                                        itemCount: state.movieDetailsModel
                                                ?.genres?.length ??
                                            0,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            width: 65.w,
                                            height: 25.h,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                                border: Border.all(
                                                  color: AppColor.borderColor,
                                                  width: 1.w,
                                                ),),
                                            child: Text(
                                              state.movieDetailsModel
                                                      ?.genres?[index].name ??
                                                  "",
                                              style: AppStyles.genreText,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    SizedBox(
                                      height: 120.h,
                                      child: SingleChildScrollView(
                                        child: Text(
                                          state.movieDetailsModel?.overview ??
                                              "",
                                          style: AppStyles.bodySmall.copyWith(
                                              color: AppColor.genreTextColor,
                                              height: 1.5),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          ShaderMask(
                                            blendMode: BlendMode.srcIn,
                                            shaderCallback: (Rect bounds) {
                                              return const RadialGradient(
                                                colors: [
                                                  AppColor.primaryColor,
                                                  AppColor.primaryLinearColor
                                                ],
                                              ).createShader(bounds);
                                            },
                                            child: const Icon(
                                              Icons.star,
                                              size: 20,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 7.w,
                                          ),
                                          Text(
                                            "${state.movieDetailsModel?.voteAverage ?? 0.toStringAsFixed(2)}",
                                            style: AppStyles.averageRate,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Expanded(
                  child: ContainerMovie(
                    text: "More Like This",
                    child: ListView.separated(
                      itemCount: state.moreLikeModel?.results?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return MovieListWidget(
                          imageUrl:
                              "${Constants.imagePath}${state.moreLikeModel?.results?[index].posterPath ?? ""}",
                          voteAverage:
                              "${state.moreLikeModel?.results?[index].voteAverage ?? 0.toStringAsFixed(2)}",
                          movieTitle:
                              state.moreLikeModel?.results?[index].title ?? "",
                          releaseDate: state
                                  .moreLikeModel?.results?[index].releaseDate ??
                              "",
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutesNames.movieDetails,
                              arguments:
                                  state.moreLikeModel?.results?[index].id ?? 0,
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 14.w,
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
