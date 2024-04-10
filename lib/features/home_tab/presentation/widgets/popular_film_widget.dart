import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/core/utils/app_colors.dart';
import 'package:route_movie_app/core/utils/app_images.dart';
import 'package:route_movie_app/core/utils/styles.dart';

class PopularFilmWidget extends StatelessWidget {
  PopularFilmWidget(
      {super.key,
      required this.imageBackdropPath,
      required this.imagePosterPath,
      required this.filmDate,
      required this.filmTitle});
  String imageBackdropPath;
  String imagePosterPath;
  String filmTitle;
  String filmDate;
  bool watchlist = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: imageBackdropPath,
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
                      imageUrl: imagePosterPath,
                      width: 129.w,
                      height: 199.h,
                      fit: BoxFit.fill,
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
                  ),
                  InkWell(
                    onTap: () {
                      watchlist = true;
                    },
                    child: watchlist
                        ? Image.asset(
                            AppImages.icWatchListBookmark,
                            width: 27.w,
                            height: 36.h,
                          )
                        : Image.asset(
                            AppImages.icBookmark,
                            width: 27.w,
                            height: 36.h,
                          ),
                  ),
                ],
              ),
              SizedBox(width: 12.w),
              Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 108.h),
                  Text(
                    filmTitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppStyles.bodyLarge.copyWith(fontSize: 14.sp),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    filmDate,
                    style: AppStyles.bodyMedium.copyWith(
                        color: AppColor.movieDateColor, fontSize: 10.sp),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
