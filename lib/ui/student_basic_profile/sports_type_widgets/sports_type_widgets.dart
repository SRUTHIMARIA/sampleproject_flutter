import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';
import 'package:flutter_template/widgets/text/text_style.dart';


class SportsTypeWidget extends StatefulWidget {
  final String image;
  final String label;
  final String secondLabel;
  final bool nextLine;
  final double topSpacing;

  final void Function() onPress;

  const SportsTypeWidget(
      {Key? key,
        required this.image,
        required this.label,
        required this.onPress,
        this.topSpacing = 0,
        this.secondLabel = "",
        required this.nextLine,})
      : super(key: key);

  @override
  State<SportsTypeWidget> createState() => _SportsTypeWidgetState();
}

class _SportsTypeWidgetState extends State<SportsTypeWidget> {

  int isSelected  = -1;

  _isSelected(int index) {
    setState(() {
      isSelected = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child:
      Container(
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
            ],
              // color: isSelected != null && isSelected == index //set condition like this. voila! if isSelected and list index matches it will colored as white else orange.
              //     ? Colors.white
              //     : Colors.orange,
              colors: [
        AppColors.gridColor1.withOpacity(0.8),
              AppColors.gridColor2.withOpacity(0.25),
            ],),
            borderRadius: const BorderRadius.all(Radius.circular(15)),),
        // margin: EdgeInsets.only(left: commonHPadding(context)/2,right: commonHPadding(context)/2, top: context.widthPx * 10,bottom: context.widthPx * 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: context.heightPx * widget.topSpacing),
            Expanded(
              flex: 3,
              child: Align(
                alignment: FractionalOffset.center,
                child: Transform.scale(
                  scale: context.screenWidth > 600 ? 1.5 : 1,
                  child: SvgPicture.asset(
                    widget.image,
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
                      widget.label,
                      textAlign: TextAlign.center,
                      style: FontData().montFont10TextStyle,
                    ),
                    widget.nextLine == true
                        ? Text(
                      widget.secondLabel,
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
