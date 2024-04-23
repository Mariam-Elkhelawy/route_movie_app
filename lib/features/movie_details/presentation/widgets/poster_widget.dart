import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';

class PosterWidget extends StatelessWidget {
  const PosterWidget({
    super.key,
    required this.posterUrl,
    required this.onTap,
    required this.child,
  });
  final String posterUrl;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        CachedNetworkImage(
          width: 129.w,
          height: 210.h,
          fit: BoxFit.fill,
          imageUrl: posterUrl,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(
              value: downloadProgress.progress,
              color: AppColor.primaryColor,
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Positioned(
          left: -2,
          child: InkWell(
            onTap: () {
              onTap();
            },
            child: child,
          ),
        ),
      ],
    );
  }
}
