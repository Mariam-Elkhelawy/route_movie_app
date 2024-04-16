import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/core/utils/app_colors.dart';
import 'package:route_movie_app/core/utils/styles.dart';

class ContainerGenreWidget extends StatelessWidget {
  const ContainerGenreWidget({
    super.key,
    required this.genreName,
  });
  final String genreName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.w,
      height: 25.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: AppColor.borderColor,
          width: 1.w,
        ),
      ),
      child: Text(
        genreName,
        style: AppStyles.genreText,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
