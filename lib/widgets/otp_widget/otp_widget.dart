import 'package:flutter/cupertino.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';
import 'package:pinput/pin_put/pin_put.dart';


class OtpWidget extends StatefulWidget {
  final TextEditingController otpFieldController;
  final double width;
  final double height;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;
  const OtpWidget({
    Key? key,
    required this.otpFieldController,
    required this.onChange,
    this.width = 56,
    this.height = 63,
    this.validator,
  }) : super(key: key);

  @override
  OtpWidgetState createState() => OtpWidgetState();
}

class OtpWidgetState extends State<OtpWidget> {
  BoxDecoration otpDecoration = BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(4)),
    // color: Color.fromRGBO(242, 241, 255, 1),
    border: Border.all(color: AppColors.greyColor, width: 1),
    color: AppColors.darkGreyColor.withOpacity(0.5),
  );
  @override
  Widget build(BuildContext context) {
    return PinPut(
      onEditingComplete: () => FocusScope.of(context).unfocus(),
      validator: widget.validator,
      useNativeKeyboard: true,
      autovalidateMode: AutovalidateMode.always,
      withCursor: true,
      fieldsCount: 4,
      keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
      fieldsAlignment: MainAxisAlignment.spaceAround,
      textStyle: TextStyle(fontSize: context.textPx * 25.0, color: AppColors.blackColor),
      eachFieldMargin: const EdgeInsets.all(0),
      eachFieldWidth: context.widthPx * widget.width,
      eachFieldHeight: context.heightPx * widget.height,
      controller: widget.otpFieldController,
      submittedFieldDecoration: otpDecoration,
      selectedFieldDecoration: otpDecoration,
      followingFieldDecoration: otpDecoration,
      enableInteractiveSelection: false,
      pinAnimationType: PinAnimationType.scale,
      onChanged: widget.onChange,
    );
  }
}
