import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/core/utils/app_colors.dart';
import 'package:route_movie_app/core/utils/app_strings.dart';
import 'package:route_movie_app/core/utils/styles.dart';

class CustomShowDialog extends StatelessWidget {
  const CustomShowDialog(
      {super.key,
      required this.dialogContent,
      this.actionRequired,
      this.is2Actions = false});

  final String dialogContent;
  final VoidCallback? actionRequired;
  final bool is2Actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(dialogContent),
      actions: [
        ElevatedButton(
          onPressed: () {
            actionRequired?.call();
            Navigator.pop(context);
          },
          child: const Text(
            AppStrings.ok,
          ),
        ),
        if (is2Actions)
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              AppStrings.cancel,
            ),
          ),
      ],
    );
  }
}
