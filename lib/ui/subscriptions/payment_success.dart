import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';

import '../../models/SubscriptionModel/subscription_model.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  _PaymentSuccessState createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: context.heightPx * 70,
            ),
            SvgPicture.asset(Assets.images.imagePaymentPopup),
            SizedBox(
              height: context.heightPx * 70,
            ),
             Text('Payment Successful!',style: const FontData().montFont70020TextStyle,),
            SizedBox(
              height: context.heightPx * 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text('Transaction ID: ',style: const FontData().montFont50012BlackTextStyle,),
                Text('zzxsdasd5487815',style: const FontData().montFont50012BlackTextStyle,),
              ],
            ),
            SizedBox(
              height: context.heightPx * 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children:  [
                Text('Bank: ',style: const FontData().montFont50012BlackTextStyle,),
                Text('Bank name',style: const FontData().montFont50012BlackTextStyle,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
