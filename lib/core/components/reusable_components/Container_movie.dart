import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/core/utils/app_colors.dart';
import 'package:route_movie_app/core/utils/styles.dart';

import '../../utils/app_images.dart';

class ContainerMovie extends StatelessWidget {
  const ContainerMovie({
    super.key,
     required this.text,
     this.width,
     this.height,
    required this.child,
  });
  final String text;
  final double? width;
  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: AppColor.moviesContainerBgColor,
      child: Padding(
        padding:  EdgeInsets.only(left: 18.w,top: 8.h,bottom: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: AppStyles.bodyMedium.copyWith(fontSize: 15.sp),
            ),
            SizedBox(height: 13.h,),
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
