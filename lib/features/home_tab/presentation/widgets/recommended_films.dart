import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/core/utils/app_colors.dart';
import 'package:route_movie_app/core/utils/styles.dart';
import 'package:route_movie_app/features/home_tab/presentation/widgets/new_relase_films.dart';

class RecommendedFilms extends StatelessWidget {
  RecommendedFilms(
      {super.key,
      required this.filmImage,
      required this.filmDate,
      required this.filmName,
      required this.filmRating});
  String filmImage;
  String filmRating;
  String filmName;
  String filmDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 186.h,
      width: 97.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: AppColor.movieItemBgColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NewReleasesFilms(filmImage: filmImage),
          Padding(
            padding: const EdgeInsets.all(6.0),
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
                        size: 14,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      filmRating,
                      style: AppStyles.displaySmall,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  filmName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.displaySmall,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  filmDate,
                  style: AppStyles.bodySmall.copyWith(
                    fontSize: 8.sp,
                    color: AppColor.movieDateColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
