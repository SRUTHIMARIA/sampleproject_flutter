import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';


class SubscriptionDetail extends StatefulWidget {
  const SubscriptionDetail({Key? key}) : super(key: key);

  @override
  _SubscriptionDetailState createState() => _SubscriptionDetailState();
}

class _SubscriptionDetailState extends State<SubscriptionDetail> {


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
                    height: context.heightPx * 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Plan Details',
                        style: const FontData().montFont60014BlackTextStyle,
                      ),
                      SizedBox(
                        width: context.widthPx * 240,
                      ),
                      Text(
                        '\$09',
                        style: const FontData().montFont70020GreenTextStyle,
                      ),

                      Text(
                        '/30days',
                        style: const FontData().montFont50010GreenTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.heightPx * 10,
                  ),
                  Text(
                    'Assist Athletes',
                    style: const FontData().montFont50012GreyTextStyle,
                  ),
                  SizedBox(
                    height: context.heightPx * 16,
                  ),
                  Row(
                    children: const [
                      Text(
                        ' • ',
                        style: TextStyle(color: AppColors.textGrey),
                      ),
                      Text('Plan is applicable only for the students of\n Mikhaela',
                        style: TextStyle(
                          color: AppColors.textGrey,
                        ),),
                    ],
                  ),
                  SizedBox(
                    height: context.heightPx * 10,
                  ),
                  Row(
                    children: const [
                      Text(
                        ' • ',
                        style: TextStyle(color: AppColors.textGrey),
                      ),
                      Text('5 days free trail will be available',
                        style: TextStyle(
                          color: AppColors.textGrey,
                        ),),
                    ],
                  ),
                  SizedBox(
                    height: context.heightPx * 540,
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
                              AppColors.buttonGradient1.withOpacity(0.76), AppColors.buttonGradient2.withOpacity(0.63),
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
