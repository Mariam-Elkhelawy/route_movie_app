import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/core/utils/app_colors.dart';
import 'package:route_movie_app/core/utils/styles.dart';

class CustomSearchWidget extends StatelessWidget {
  CustomSearchWidget(
      {super.key,
      required this.filmImage,
      required this.filmName,
      required this.filmOverView,
      required this.filmYear});
  String filmImage;
  String filmName;
  String filmOverView;
  String filmYear;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0.h, horizontal: 8.w),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4.r),
                      child: CachedNetworkImage(
                        imageUrl: filmImage,
                        fit: BoxFit.cover,
                        width: 140.w,
                        height: 95.h,
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
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 215.w,
                        child: Text(
                          filmName,
                          overflow: TextOverflow.visible,
                          maxLines: 2,
                          style: AppStyles.bodyMedium.copyWith(fontSize: 15.sp),
                        ),
                      ),
                      Text(filmYear, style: AppStyles.bodySmall),
                      SizedBox(
                        width: 215.w,
                        child: Text(filmOverView,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppStyles.bodySmall),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 4.h),
          const Divider(
            color: AppColor.dividerColor,
          ),
        ],
      ),
    );
  }
}
