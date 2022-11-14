
import 'package:animated_widgets/widgets/translation_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/login_screen/login_screen.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';

class SplashAnimationScreen extends StatefulWidget {
  @override
  State<SplashAnimationScreen> createState() => _SplashAnimationScreenState();
}

class _SplashAnimationScreenState extends State<SplashAnimationScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor.withOpacity(0.40),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.bgPrimarySplash,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Image.asset(
                Assets.images.atheleteSplash.path,


              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Container(

                    child: Text('THE ASSIST ATHLETE\n - GROWTH MINDSET\n JOURNEY',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Mont',
                        fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),),
                  ),
                  SizedBox(height: 30,),
                  // AnimatedPositioned(
                  //   width: selected ? 200.0 : 50.0,
                  //   height: selected ? 50.0 : 200.0,
                  //   top: selected ? 50.0 : 150.0,
                  //   duration: const Duration(seconds: 2),
                  //   curve: Curves.fastOutSlowIn,
                  //   child: GestureDetector(
                  //     onTap: () =>
                  //       setState(() {
                  //         selected = !selected;
                  //       }),
                  //
                  //     child: Container(
                  //       color: Colors.blue,
                  //       child: const Center(child: Text('Tap me')),
                  //     ),
                  //   ),
                  // ),

                  // TranslationAnimatedWidget.tween(
                  //   enabled: this._display,
                  //   translationDisabled: Offset(0, 200),
                  //   translationEnabled: Offset(0, 0),
                  //   child:
                  //   OpacityAnimatedWidget.tween(
                  //       enabled: this._display,
                  //       opacityDisabled: 0,
                  //       opacityEnabled: 1,
                  //       child:Image.asset(Assets.icons.iconForward.path),),
                  // ),


                  TranslationAnimatedWidget.tween(
                    // enabled: _display,
                    translationDisabled: const Offset(200, 0),
                    translationEnabled: const Offset(0, 0),
                    child: TranslationAnimatedWidget.tween(
                      // opacityEnabled: 1, //define start value
                      // opacityDisabled: 0, //and end value
                      duration: const Duration(milliseconds: 5),

                      translationDisabled: const Offset(100, 100),
                      translationEnabled: const Offset(0, 0),
                      // enabled: _display,
                      curve: Curves.ease,
                      //bind with the boolean
                      child: Container(

                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: InkWell(
                          onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen())),

                            child: Image.asset(Assets.icons.iconForward.path),),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
