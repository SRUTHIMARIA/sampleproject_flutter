import 'package:flutter/material.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';


class LoaderWidget extends StatelessWidget {
  final double radius;
  const LoaderWidget({Key? key, this.radius = 30}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: radius,
        height: radius,
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          strokeWidth: 3,
          backgroundColor: AppColors.whiteColor,
        ),
      ),
    );
  }
}
