import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/core/utils/app_colors.dart';
import 'package:route_movie_app/core/utils/app_images.dart';
import 'package:route_movie_app/core/utils/app_strings.dart';
import 'package:route_movie_app/core/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, this.onChanged, this.searchController});
  void Function(String)? onChanged;
  TextEditingController? searchController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: searchController,
      style: AppStyles.bodyMedium,
      cursorColor: AppColor.cursorColor,
      decoration: InputDecoration(
        hintText: AppStrings.searchHint,
        contentPadding: EdgeInsets.all(14.r),
        hintStyle: AppStyles.bodyMedium.copyWith(
          color: AppColor.whiteColor.withOpacity(.46),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 4.0.r),
          child: IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage(AppImages.searchTextField),
              color: AppColor.whiteColor,
            ),
          ),
        ),
        filled: true,
        fillColor: AppColor.borderColor.withOpacity(.58),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: const BorderSide(color: AppColor.whiteColor, width: .5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: const BorderSide(color: AppColor.whiteColor, width: .5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: const BorderSide(color: AppColor.whiteColor, width: .5),
        ),
      ),
    );
  }
}
