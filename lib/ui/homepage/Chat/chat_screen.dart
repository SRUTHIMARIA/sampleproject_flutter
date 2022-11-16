import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import '../../../models/ChatModel/message_model.dart';
import '../../../models/ChatModel/user_model.dart';
import 'package:flutter_template/ui/homepage/homepage.dart';
import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';

import '../../../utils/theme/app_colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _chatBubble(Message message, bool isMe, bool isSameUser) {
    return isMe
        ? Column(children: <Widget>[
            Container(
                alignment: Alignment.topRight,
                child: Container(
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.80),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: AppColors.themeColor,
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 2, blurRadius: 5)],),
                    child: Text(message.text, style: const FontData().montFont500WhiteTextStyle),),),
            if (!isSameUser) Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                    Text(message.time, style: const FontData().montFont40012greyTextStyle),
                    const SizedBox(width: 10),
                  ]) else Container(child: null),
          ])
        : Column(children: <Widget>[
            Container(
                alignment: Alignment.topLeft,
                child: Container(
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.80),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 2, blurRadius: 5)],),
                    child: Text(message.text, style: const FontData().montFont500TextStyle),),),
            if (!isSameUser) Row(children: <Widget>[
                    const SizedBox(width: 10),
                    Text(message.time, style: const FontData().montFont40012greyTextStyle),
                  ]) else Container(child: null),
          ]);
  }

  _sendMessageArea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: AppColors.primaryColor.withOpacity(0.10),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(14.0)),
              ),
              child: Center(
                child: TextField(
                  textAlign: TextAlign.justify,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    hintText: 'Message',
                    hintStyle: const FontData().montFont500TextStyle,
                  ),
                  textCapitalization: TextCapitalization.sentences,
                ),
              ),
            ),
          ),
          IconButton(
            icon: SvgPicture.asset(Assets.icons.iconAttachment),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(Assets.icons.iconSend),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int? prevUserId;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.40),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: context.heightPx * 70,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage())),
                  child: Container(
                    margin: EdgeInsets.only(left: context.heightPx * 32),
                    child: SvgPicture.asset(Assets.icons.iconBackarrow),
                  ),
                ),
                SizedBox(
                  width: context.widthPx * 10,
                ),
                Text(
                  'Contact Support',
                  style: const FontData().montFont60018BlackTextStyle,
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                reverse: false,
                padding: const EdgeInsets.all(20),
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final Message message = messages[index];
                  final bool isMe = message.sender.id == currentUser.id;
                  final bool isSameUser = prevUserId == message.sender.id;
                  prevUserId = message.sender.id;

                  return _chatBubble(message, isMe, isSameUser);
                },
              ),
            ),
            _sendMessageArea(),
          ],
        ),
      ),
    );
  }
}
