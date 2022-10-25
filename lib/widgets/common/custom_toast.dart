import 'package:flutter_template/utils/theme/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ToastAtTop {
  const ToastAtTop();


  void showToast( String message){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor:  AppColors.themeColor,
      textColor: AppColors.whiteColor,
      fontSize: 16.0,
    );
  }




}
