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
            padding: EdgeInsets.symmetric(vertical: 6.0.h, horizontal: 8.w),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Image.network(filmImage),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        filmName,
                        style: AppStyles.bodyMedium.copyWith(fontSize: 15.sp),
                      ),
                      Text(filmYear, style: AppStyles.bodySmall),
                      Text(filmOverView,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.bodySmall),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: AppColor.dividerColor,
          )
        ],
      ),
    );
  }
}
