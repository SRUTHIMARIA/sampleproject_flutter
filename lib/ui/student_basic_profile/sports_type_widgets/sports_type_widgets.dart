import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';
import 'package:flutter_template/widgets/text/text_style.dart';


class MainHomeItemWidget extends StatelessWidget {
  final String image;
  final String label;
  final String secondLabel;
  final bool nextLine;
  final double topSpacing;

  final void Function() onPress;

  const MainHomeItemWidget(
      {Key? key,
        required this.image,
        required this.label,
        required this.onPress,
        this.topSpacing = 0,
        this.secondLabel = "",
        required this.nextLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        height: context.heightPx *126,
        width: context.widthPx *126,
        // height: (context.screenWidth - context.widthPx * 40) / (context.screenWidth > 600 ? 2.13 : 2.2),
        // width: (context.screenWidth - context.widthPx * 40) / (context.screenWidth > 600 ? 2.13 : 2.2),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight, stops: [
              0.0,
              0.0,
            ], colors: [
              AppColors.gridColor1.withOpacity(0.8),
              AppColors.gridColor2.withOpacity(0.25),
            ]),
            borderRadius: BorderRadius.circular(15)),
        // margin: EdgeInsets.only(left: commonHPadding(context)/2,right: commonHPadding(context)/2, top: context.widthPx * 10,bottom: context.widthPx * 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: context.heightPx * topSpacing),
            Expanded(
              flex: 3,
              child: Align(
                alignment: FractionalOffset.center,
                child: Transform.scale(
                  scale: context.screenWidth > 600 ? 1.5 : 1,
                  child: SvgPicture.asset(
                    image,
                    width: context.widthPx * 100,
                    height: context.heightPx * 50,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: context.heightPx * 25.0,
                ),
                child: Column(
                  children: [
                    Text(
                      label,
                      textAlign: TextAlign.center,
                      style: FontData().montFont10TextStyle,
                    ),
                    nextLine == true
                        ? Text(
                      secondLabel,
                      textAlign: TextAlign.center,
                      style: FontData().montFont10TextStyle,
                    )
                        : const SizedBox(),
                  ],
                ), //Your widget here,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
