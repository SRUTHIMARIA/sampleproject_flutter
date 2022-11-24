import 'package:flutter/material.dart';
import 'package:flutter_template/ui/homepage/homepage.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';


import '../../ui/profile/profile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});


  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(),
          // _drawerHeader(),
          SizedBox(
            height: context.heightPx * 50,
          ),
          ListTile(
            title: Text(
              'Subscriptions',
              style: TextStyle(
                fontSize: context.heightPx * 16,
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
                fontFamily: 'OpenSans',),
            ),
          ),
          InkWell(
            onTap: () =>
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  HomePage(),),),

            child: ListTile(
              title: Text(
                'Your Trips',
                style: TextStyle(
                  fontSize: context.heightPx * 16,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'OpenSans',),
              ),
            ),
          ),
          InkWell(
            onTap: () =>
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profile(),),),

            child: ListTile(
              title: Text(
                'Free Rides',
                style: TextStyle(
                  fontSize: context.heightPx * 16,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'OpenSans',),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Help',
              style: TextStyle(
                fontSize: context.heightPx * 16,
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
                fontFamily: 'OpenSans',),
            ),
          ),
          ListTile(
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: context.heightPx * 16,
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
                fontFamily: 'OpenSans',),
            ),
          ),
        ],
      ),
    );
  }

}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(
      color: AppColors.grey,
      width: double.infinity,
      height: context.heightPx * 150,
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/image_user.png'),
            radius: 40.0,),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.heightPx * 50),
              Text(
                'Ronald Richards',
                style: TextStyle(
                  fontSize: context.heightPx * 14,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'OpenSans',),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    '5.0',
                    style: TextStyle(
                      fontSize: context.heightPx * 14,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'OpenSans',),
                  ),
                  SizedBox(width: context.heightPx * 2),
                  Icon(
                    Icons.star,
                    color: AppColors.redColor,
                    size: context.heightPx * 14,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

}

