import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/globals.dart';
import 'package:flutter_template/widgets/button_widget/button_widget.dart';
import 'package:flutter_template/widgets/text/text_style.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../gen/assets.gen.dart';
import '../../utils/theme/app_colors.dart';

class CameraPermissionPopup extends StatelessWidget {
  const CameraPermissionPopup({Key? key}) : super(key: key);
  void onTap() {
    openAppSettings();
    Globals.navigatorKey.currentContext!.router.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          context.widthPx * 5,
        ),
      ),
      elevation: 16,
      child: Container(
        // height:getHeight(context,gt360:317,lt360: 340,gt600: 315 ),
        width: context.heightPx * 344,
        padding: EdgeInsets.symmetric(
          horizontal: context.widthPx * 22,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: context.heightPx * 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => context.router.pop(),
                  child: const Icon(
                    Icons.close,
                  ),
                ),
              ],
            ),
            Image.asset(Assets.images.imageAddphoto.path,
              width: context.widthPx * 80,
              height: context.heightPx * 80,
            ),
            SizedBox(
              height: context.heightPx * 17,
            ),
            Text(
              'To capture photos, allow Doro to access your camera. Tap Settings > Permissions, and turn Camera on.',
              style: TextFontStyle.normal(
                size: context.textPx * 14,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(
              height: context.heightPx * 16,
            ),
            ButtonWidget(
              label: 'NOT NOW',
              socialMediaIcon: const SizedBox(),
              textSize: context.screenWidth < 600 ? context.textPx * 15 : context.textPx * 13,
              disabledColor: AppColors.whiteColor,
              onPress: () => context.router.pop(),
            ),
            SizedBox(
              height: context.heightPx * context.screenWidth < 600 ? 0 : 20,
            ),
            ButtonWidget(
              label: 'SETTINGS',
              border: true,
              textSize: context.screenWidth < 600 ? context.textPx * 15 : context.textPx * 13,
              socialMediaIcon: const SizedBox(),
              color: AppColors.whiteColor,
              disabledColor: AppColors.darkGreen,
              textColor: AppColors.darkGreen,
              onPress: () => onTap(),
            ),
            SizedBox(
              height: context.heightPx * 16,
            ),
          ],
        ),
      ),
    );
  }
}
