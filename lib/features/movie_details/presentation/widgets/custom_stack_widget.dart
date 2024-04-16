import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class CustomStackWidget extends StatelessWidget {
  const CustomStackWidget({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CachedNetworkImage(
          width: 412.w,
          height: 217.h,
          fit: BoxFit.cover,
          imageUrl: imageUrl,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(
              value: downloadProgress.progress,
              color: AppColor.primaryColor,
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Icon(
          Icons.play_circle_filled_outlined,
          color: AppColor.whiteColor,
          size: 60.w,
        ),
      ],
    );
  }
}
