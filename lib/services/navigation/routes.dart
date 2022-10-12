import 'package:flutter/material.dart';

class Routes {
  const Routes();

  void goTo( BuildContext context, screen){
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder:
          (context) => screen,
      ),
    );
  }

  void goBack( BuildContext context){
    Navigator.pop(context);
  }


  void replace( BuildContext context, screen){
    Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder:
          (context) => screen,
      ), (r){
        return false;
      },);
    // Navigator.pushReplacement(context,
    //   MaterialPageRoute(builder:
    //       (context) => screen,
    //   ),
    // );
  }

  void pushReplacement( BuildContext context, screen){
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder:
          (context) => screen,
      ),
    );
  }



}

