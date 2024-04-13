import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/core/components/reusable_components/Container_movie.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({
    super.key,
    required this.text,
    this.itemCount,
    this.imageUrl,
  });
  final String text;
  final int? itemCount;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return ContainerMovie(
      width: 565.w,
      height: 246.h,
      text: text,
      child: ListView.builder(
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
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
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      width: 97.w,
                      height: 128.h,
                      fit: BoxFit.fill,
                      imageUrl: imageUrl ?? "",
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          Center(
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                    Image.asset(
                      AppImages.icBookmark,
                      width: 27.w,
                      height: 36.h,
                    ),
                  ],
                ),
                SizedBox(height: 5.h,),
                Row(children: [
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
                  SizedBox(width: 4.w,),
                  Text(''),

                ],)

              ],
            ),
          );
        },
      ),
    );
  }
}
