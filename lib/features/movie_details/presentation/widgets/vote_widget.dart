import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';

class VoteWidget extends StatelessWidget {
  const VoteWidget({
    super.key,
    required this.voteAverage,
  });
  final String voteAverage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) {
              return const RadialGradient(
                colors: [AppColor.primaryColor, AppColor.primaryLinearColor],
              ).createShader(bounds);
            },
            child: const Icon(
              Icons.star,
              size: 20,
            ),
          ),
          SizedBox(
            width: 7.w,
          ),
          Text(
            voteAverage,
            style: AppStyles.averageRate,
          )
        ],
      ),
    );
  }
}
