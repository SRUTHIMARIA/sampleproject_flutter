import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/providers/chat_provider/chat_provider.dart';
import 'package:flutter_template/providers/theme_provider.dart';
import 'package:flutter_template/ui/homepage/homepage.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';
import 'package:flutter_template/widgets/listitems/listitems.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/constants/font_data.dart';

final firestore = FirebaseFirestore.instance;

class ChatSession extends StatefulWidget {
  ChatSession({Key? key}) : super(key: key);

  @override
  State<ChatSession> createState() => _ChatSessionState();
}

class _ChatSessionState extends State<ChatSession> {
  final newMessage = TextEditingController();

  final controller = ScrollController();

  final databaseReference = FirebaseDatabase.instance.ref();

  int _selectedIndex = 0;
  List<Widget> messageWidgets = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          // backgroundColor: AppColors.primaryColor.withOpacity(0.20),
          //  appBar: AppBar(
          //   titleSpacing: 0,
          //   elevation: 0.0,
          //   centerTitle: false,
          //   leading: IconButton(
          //     icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          //     onPressed: () => Navigator.of(context).pop(),
          //   ),
          //   title: const Text('Coach Support'),
          //    backgroundColor: AppColors.primaryColor.withOpacity(0.20),
          // ),
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 0),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.30),
            ),
            child: Column(
              children: [
                const SizedBox(height: 15.0),
                SizedBox(
                  height: context.heightPx * 70,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () =>
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage())),
                      child: Container(
                        margin: EdgeInsets.only(left: context.heightPx * 30),
                        child: SvgPicture.asset(Assets.icons.iconBackarrow),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: context.heightPx * 20),
                      child: Text(
                        'Coach Support',
                        style: const FontData().montFont70020TextStyle,
                      ),
                    ),
                  ],
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: firestore
                      .collection(
                        '${Provider.of<ChatProvider>(context, listen: false).to}:${Provider.of<ChatProvider>(context, listen: false).from}',
                      )
                      .orderBy('timestamp', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    // final messages = snapshot.data?.docs.reversed;
                    List<Widget> messageWidgets = snapshot.data!.docs.map<Widget>((m) {
                      final data = m.data as dynamic;

                      return const ListItemViews().chatBubble(
                          width: context.screenWidth, height: context.screenHeight, data: data, context: context);
                    }).toList();

                    return Expanded(
                      child: ListView(
                        reverse: true,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                        children: messageWidgets,
                      ),
                    );
                  },
                ),
                Container(
                  color: AppColors.primaryColor.withOpacity(0.10),
                  width: context.screenWidth,
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: context.screenWidth * 0.8 - 20,
                            constraints: BoxConstraints(
                              minHeight: context.screenWidth * 0.1,
                              maxHeight: 250,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(0.10),
                              borderRadius: const BorderRadius.all(Radius.circular(14.0)),
                            ),
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),

                            child: TextFormField(
                              autofocus: true,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                                border: InputBorder.none,
                                hintText: 'Message',
                                hintStyle: const FontData().montFont500TextStyle,
                                suffixIcon: SvgPicture.asset(
                                  Assets.icons.iconAttachment,
                                  width: context.screenWidth * 0.05,
                                  height: context.screenWidth * 0.05,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              cursorColor: AppColors.whiteColor,
                              style: const TextStyle(
                                color: AppColors.greyColor,
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              showCursor: true,
                              controller: newMessage,
                            ),
                            // ),
                          ),

                          GestureDetector(
                            onTap: () => validateMessage(context),
                            // Provider.of<ChatProvider>(context, listen: false).validateMessage(context),

                            child: Container(
                              // padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                              ),
                              child: SvgPicture.asset(
                                Assets.icons.iconSend,
                                width: context.screenWidth * 0.10,
                                height: context.screenWidth * 0.10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void validateMessage(BuildContext context) {
    bool isTapped = Provider.of<ChatProvider>(context, listen: false).isTapped;
    print('IS tapped status--->$isTapped');
    newMessage.text.trim().isEmpty
        ? null
        : isTapped
            ? _handleSubmitted(context)
            : null;
  }

  void _handleSubmitted(BuildContext context) {
    print('Hello world');
    Provider.of<ChatProvider>(context, listen: false).setIsTapped(false);
    var from = Provider.of<ChatProvider>(context, listen: false).from;
    var to = Provider.of<ChatProvider>(context, listen: false).to;
    var channelName = '$to:$from';
    dynamic currentTime = DateFormat.jm().format(DateTime.now().toUtc());
    dynamic date = DateTime.now();
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(date);

    firestore.collection(channelName).add({
      'date': formatted,
      'from': from,
      'time': currentTime,
      'to': to,
      'message': newMessage.text,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    }).then((_) {
      print(_.id);
      newMessage.clear();
      Provider.of<ChatProvider>(context, listen: false).setIsTapped(true);
      controller.animateTo(
        controller.position.minScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    });
    // databaseReference.child('chat').child(channelName).push().set({
    //   'date': formatted,
    //   'from': from,
    //   'time': currentTime,
    //   'to': to,
    //   'message': newMessage.text,
    // }).then((_) {
    //   newMessage.clear();
    //   controller.animateTo(
    //     controller.position.minScrollExtent,
    //     curve: Curves.easeOut,
    //     duration: const Duration(milliseconds: 300),
    //   );
    // });
    // i++;
  }
}
