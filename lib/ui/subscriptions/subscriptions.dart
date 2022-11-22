import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/subscriptions/payment_success.dart';
import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';

import '../../models/SubscriptionModel/subscription_model.dart';

class Subscriptions extends StatefulWidget {
  const Subscriptions({Key? key}) : super(key: key);

  @override
  _SubscriptionsState createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
  // final List<Map<String, dynamic>> _items = List.generate(
  //     3,
  //         (index) => {
  //
  //       'title': 'Individual Athletes',
  //           'subtitle': '\$49/30days',
  //       'content1': 'Plan is applicable only for the students of Mikhaela',
  //           'content2': '5 days free trail will be available',
  //     },);

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
                  'Subscription',
                  style: const FontData().montFont60018BlackTextStyle,
                ),
              ],
            ),
            Flexible(
              child: ListView.builder(
                itemCount: subscriptionModel.length,
                itemBuilder: (_, index) {
                  return Container(

                    margin: const EdgeInsets.all(24.0),
                    padding: const EdgeInsets.all(0.0),
                    decoration: BoxDecoration(
                      color: index % 2 == 1 ? AppColors.glassStroke : AppColors.themeColor.withOpacity(0.50),
                      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: ExpansionTile(
                      expandedAlignment: Alignment.topLeft,
                      iconColor: AppColors.lightGrey,
                      childrenPadding: const EdgeInsets.symmetric( horizontal: 20),
                      expandedCrossAxisAlignment: CrossAxisAlignment.end,
                      title: Text(
                        subscriptionModel[index].subscriptionType,
                        style: const FontData().montFont50012GreyLightTextStyle,
                      ),

                      subtitle: Text(
                        subscriptionModel[index].amount,
                        style: const FontData().montFont70020GreenTextStyle,
                      ),
                      children: [
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: AppColors.whiteColor,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: context.heightPx * 10,
                            ),
                            Text(
                              'Plan Details',
                              style: const FontData().montFont60014BlackTextStyle,
                            ),
                            SizedBox(
                              height: context.heightPx * 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  ' • ',
                                  style: TextStyle(color: AppColors.whiteColor),
                                ),
                                Text(subscriptionModel[index].planDetails1,
                                    style: const TextStyle(
                                      color: AppColors.whiteColor,
                                    ),),
                              ],
                            ),
                            SizedBox(
                              height: context.heightPx * 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  ' • ',
                                  style: TextStyle(color: AppColors.whiteColor),
                                ),
                                Text(subscriptionModel[index].planDetails2,
                                    style: const TextStyle(
                                      color: AppColors.whiteColor,
                                    ),),
                              ],
                            ),
                            SizedBox(
                              height: context.heightPx * 20,
                            ),

                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const PaymentSuccess())),

              child: Container(
                height: context.heightPx * 42,
                width: context.widthPx * 270,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.themeColor,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),),
                  child: Center(
                    child: Text(
                      'Proceed to Payment',
                      // _display ? "hide logo" : "display logo",
                      style: const FontData().montFont70016TextStyle,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: context.heightPx * 30,
            ),
          ],
        ),
      ),
    );
  }
}
