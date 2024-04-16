import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/config/routes/app_routes_names.dart';
import 'package:route_movie_app/core/components/reusable_components/isWatchList_widget.dart';
import 'package:route_movie_app/core/utils/app_colors.dart';
import 'package:route_movie_app/core/utils/constants.dart';
import 'package:route_movie_app/core/utils/styles.dart';
import 'package:route_movie_app/features/home_tab/data/models/PopularFilmModel.dart';
import 'package:route_movie_app/features/watchList_tab/data/models/watch_list_model.dart';

class PopularFilmWidget extends StatelessWidget {
  PopularFilmWidget(
      {super.key,
      required this.movie,
      required this.onTap,
      required this.isWatchList});
  VoidCallback onTap;
  bool isWatchList;
  Results movie;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
            context, AppRoutesNames.movieDetails,
            arguments: Map<String, dynamic>.from({
              "filmId": movie.id ??
                  0,
              "isWatchList": isWatchList,
            }));
      },
      child: Stack(

        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: '${Constants.imagePath}${movie.backdropPath ?? ''} ',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 217.h,
            progressIndicatorBuilder: (context, url, downloadProgress) => Center(
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
                color: AppColor.primaryColor,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const Icon(
            Icons.play_circle,
            color: AppColor.whiteColor,
            size: 60,
          ),
          Positioned(
            top: 92.h,
            left: 18.w,
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: CachedNetworkImage(
                        imageUrl:
                            '${Constants.imagePath}${movie.posterPath ?? ''} ',
                        width: 129.w,
                        height: 199.h,
                        fit: BoxFit.fill,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) {
                          return Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                              color: AppColor.primaryColor,
                            ),
                          );
                        },
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          onTap();
                        },
                        child: IsWatchList(
                          isWatchList: isWatchList,
                        )),
                  ],
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 128.h),
                    Text(
                      movie.title ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: AppStyles.bodyLarge.copyWith(fontSize: 14.sp),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      movie.releaseDate ?? '',
                      style: AppStyles.bodyMedium.copyWith(
                          color: AppColor.movieDateColor, fontSize: 10.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
