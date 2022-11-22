import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';

import '../../gen/assets.gen.dart';
import '../../utils/constants/strings.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  /// List of Tab Bar Item
  List<String> items = [
    'Daily',
    '"Weekly',
    'Monthly',
  ];

  List<String> analysis = [
    'Sleep Quality',
    'Confidence ',
    'Preparation',
    'Body Language',
    'Motivation',
    'Stress Levels',
  ];

  List<IconData> icons = [
    Icons.home,
    Icons.explore,
    Icons.search,
    Icons.feed,
    Icons.post_add,
    Icons.local_activity,
    Icons.settings,
    Icons.person,
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.40),
        ),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: context.heightPx * 70,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      margin: EdgeInsets.only(left: context.heightPx * 49),
                      child: SvgPicture.asset(Assets.icons.iconBackarrow),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      statistics,
                      style: const FontData().montFont50014BlackTextStyle,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.heightPx * 37,
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => setState(() {
                              current = index;
                            }),
                            child: Center(
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.all(5),
                                width: 120,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: current == index ? AppColors.themeColor : Colors.white54,
                                  borderRadius: current == index
                                      ? const BorderRadius.all(Radius.circular(15))
                                      : const BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Center(
                                  child: Text(
                                    items[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: current == index ? AppColors.whiteColor : AppColors.themeColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Visibility(
                          //   visible: current == index,
                          //   child: Column(
                          //     children: [
                          //
                          //       Container(
                          //         width: 5,
                          //         height: 5,
                          //         decoration: const BoxDecoration(
                          //           color: Colors.deepPurpleAccent,
                          //           shape: BoxShape.circle,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: double.infinity,
                height: 650,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        selfAnalysis,
                        style: const FontData().montFont13BlackTextStyle,
                      ),
                    ),

                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                      margin: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: AppColors.gridColor2.withOpacity(0.24),
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Sleep Quality',
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.all(5),
                                width: 200,
                                height: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xff00BBBB),
                                    width: 1,
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color(0xff00BBBB).withOpacity(0.24),
                                      const Color(0xff4BFF9E).withOpacity(0.24),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Confidence',
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.all(5),
                                width: 120,
                                height: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xffE70000).withOpacity(0.56),
                                    width: 1,
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color(0xffE70000).withOpacity(0.24),
                                      const Color(0xffFF5492).withOpacity(0.24),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Preparation',
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.all(5),
                                width: 200,
                                height: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xffFF6B00).withOpacity(0.50),
                                    width: 1,
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color(0xffFF6B00).withOpacity(0.24),
                                      const Color(0xffFFCF4B).withOpacity(0.24),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Body Language',
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.all(5),
                                width: 240,
                                height: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xff00BBBB),
                                    width: 1,
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color(0xff00BBBB).withOpacity(0.24),
                                      const Color(0xff4BFF9E).withOpacity(0.24),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Motivation',
                              ),
                              const SizedBox(
                                width: 36,
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.all(5),
                                width: 200,
                                height: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xffFF6B00).withOpacity(0.50),
                                    width: 1,
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color(0xffFF6B00).withOpacity(0.24),
                                      const Color(0xffFFCF4B).withOpacity(0.24),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Stress Levels',
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.all(5),
                                width: 120,
                                height: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xffE70000).withOpacity(0.56),
                                    width: 1,
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color(0xffE70000).withOpacity(0.24),
                                      const Color(0xffFF5492).withOpacity(0.24),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Text(
                    //   items[current],
                    //   style: const TextStyle(
                    //     fontWeight: FontWeight.w500,
                    //     fontSize: 30,
                    //     color: Colors.deepPurple,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
