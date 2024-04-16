import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/config/routes/app_routes_names.dart';
import 'package:route_movie_app/core/components/reusable_components/isWatchList_widget.dart';
import 'package:route_movie_app/core/utils/constants.dart';
import 'package:route_movie_app/core/utils/styles.dart';
import '../../../features/home_tab/data/models/PopularFilmModel.dart';
import '../../utils/app_colors.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget(
      {super.key,
      required this.onClicked,
      required this.movie,
      required this.isWatchList});

  final VoidCallback onClicked;
  final Results movie;
  final bool isWatchList;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutesNames.movieDetails,
            arguments: Map<String, dynamic>.from({
              "filmId": movie.id ?? 0,
              "isWatchList": isWatchList,
            }));
      },
      child: Container(
        width: 97.w,
        height: 186.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: AppColor.movieItemBgColor,
          boxShadow: [
            BoxShadow(
              color: AppColor.blackColor.withOpacity(0.161),
              blurRadius: 3.r,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  width: 97.w,
                  height: 128.h,
                  fit: BoxFit.cover,
                  imageUrl: '${Constants.imagePath}${movie.posterPath ?? ''} ',
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Positioned(
                  left: -2,
                  child: InkWell(
                      onTap: () {
                        onClicked();
                      },
                      child: IsWatchList(isWatchList: isWatchList)),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                          size: 10,
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        '${movie.voteAverage ?? 0}',
                        style: AppStyles.displaySmall,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(movie.title ?? 'Movie Title',
                      style: AppStyles.displaySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(movie.releaseDate ?? '', style: AppStyles.dateText),
                  SizedBox(
                    height: 9.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
