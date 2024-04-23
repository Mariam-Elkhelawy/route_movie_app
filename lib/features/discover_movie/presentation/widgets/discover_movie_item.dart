import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/core/utils/styles.dart';

import '../../../../core/utils/app_colors.dart';

class DiscoverMovieItem extends StatelessWidget {
  const DiscoverMovieItem({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.voteAverage,
    required this.onTap,
  });
  final String imageUrl;
  final String text;
  final String voteAverage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                onTap();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.h),
                child: CachedNetworkImage(
                  width: 115.w,
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.bodyMedium,
          ),
          SizedBox(
            height: 2.h,
          ),
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
                voteAverage,
                style: AppStyles.displaySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
