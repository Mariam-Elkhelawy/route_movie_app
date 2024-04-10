import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/core/utils/styles.dart';

class CustomWatchList extends StatelessWidget {
  CustomWatchList(
      {super.key,
      required this.isWatchList,
      required this.filmImage,
      required this.filmName,
      required this.filmOverView,
      required this.filmYear});
  bool isWatchList;
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
                    if (isWatchList)
                      Image.asset(
                        'assets/images/ic_watchList_bookmark.png',
                        width: 27.w,
                        height: 36.h,
                      )
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
          Divider(
            color: Color(0xFF707070),
          )
        ],
      ),
    );
  }
}
