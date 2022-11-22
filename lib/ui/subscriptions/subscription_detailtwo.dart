import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';

import '../../models/SubscriptionModel/subscription_model.dart';

class SubscriptionDetailTwo extends StatefulWidget {
  const SubscriptionDetailTwo({Key? key}) : super(key: key);

  @override
  _SubscriptionDetailTwoState createState() => _SubscriptionDetailTwoState();
}

class _SubscriptionDetailTwoState extends State<SubscriptionDetailTwo> {


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
          children: [
            SizedBox(
              height: context.heightPx * 70,
            ),
            Row(
              children: [
                InkWell(
                  // onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage())),
                  child: Container(
                    margin: EdgeInsets.only(left: context.heightPx * 32),
                    child: SvgPicture.asset(Assets.icons.iconBackarrow),
                  ),
                ),
                SizedBox(
                  width: context.widthPx * 10,
                ),
                Text(
                  'Subscription Details',
                  style: const FontData().montFont60018BlackTextStyle,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 27.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.heightPx * 70,
                  ),
                  Text(
                    'Assist Athletes',
                    style: const FontData().montFont70018BlackTextStyle,
                  ),
                  SizedBox(
                    height: context.heightPx * 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Text(
                        '\$09',
                        style: const FontData().montFont70029GreenTextStyle,
                      ),

                      Text(
                        '/30days',
                        style: const FontData().montFont50010GreenTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.heightPx * 30,
                  ),
                  Text(
                    'Plan Details',
                    style: const FontData().montFont60014BlackTextStyle,
                  ),

                  SizedBox(
                    height: context.heightPx * 30,
                  ),
                  Row(
                    children:  [
                      Text(
                        ' • ',
                        style: const FontData().montFont500TextStyle,
                      ),
                      Text('Plan is applicable only for the students of\n Mikhaela',
                        style: const FontData().montFont500TextStyle,),
                    ],
                  ),
                  SizedBox(
                    height: context.heightPx * 10,
                  ),
                  Row(
                    children:  [
                      Text(
                        ' • ',
                        style: const FontData().montFont500TextStyle,
                      ),
                      Text('5 days free trail will be available',
                        style: const FontData().montFont500TextStyle,),
                    ],
                  ),
                  SizedBox(
                    height: context.heightPx * 20,
                  ),

                  Row(
                    children:  [
                      const Text(
                        'Plan status',
                        style: TextStyle(color: AppColors.textGrey),
                      ),
                      SizedBox(
                        width: context.widthPx * 30,
                      ),
                       Text(
                        ':',
                        style: const FontData().montFont500TextStyle,
                      ),
                       Text('Active',
                        style: const FontData().montFont70014TextStyle,),
                    ],
                  ),

                  SizedBox(
                    height: context.heightPx * 340,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>const PaymentSuccess())),
                    },
                    child: Center(
                      child: Container(
                        height: context.heightPx * 42,
                        width: context.widthPx * 270,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.themeColor,
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),),
                          child: Center(
                            child: Text(
                              'Retry Payment',
                              // _display ? "hide logo" : "display logo",
                              style: const FontData().montFont70016TextStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.heightPx * 14,
                  ),

                  GestureDetector(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>const PaymentSuccess())),
                    },
                    child: Center(
                      child: Container(
                        height: context.heightPx * 42,
                        width: context.widthPx * 270,
                        child: Container(
                          decoration:  BoxDecoration(
                            gradient: LinearGradient(colors: [
                              AppColors.buttonGradient1.withOpacity(0.86), AppColors.buttonGradient2.withOpacity(0.73),
                            ],),
                            color: AppColors.themeColor,
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),),
                          child: Center(
                            child: Text(
                              'Cancel Subscription',
                              // _display ? "hide logo" : "display logo",
                              style: const FontData().montFont70016TextStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
