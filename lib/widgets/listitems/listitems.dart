import 'package:flutter/material.dart';
import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';


import '../../providers/chat_provider/chat_provider.dart';

class ListItemViews{
  const ListItemViews();


  Widget chatBubble({required context, required width, required height, required data}) {

    final record = data;
    DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    DateTime dateParsed = dateFormat.parse(data()['date']);
    String formattedDate = DateFormat('dd MMM').format(dateParsed);
    bool isMe = record()['from'] == Provider.of<ChatProvider>(context, listen: true).to;

    return
      oneBubble(
        date: formattedDate,
        message: record()['message'].toString(),
        time: record()['time'],
        isMe: isMe,

      );

  }


  Widget oneBubble({required message, required time, required isMe, required date}) {
    DateFormat format = DateFormat('HH:mm a');
    DateTime timeParsed = format.parse(time, true);
    String formattedTime = DateFormat('hh:mm a').format(timeParsed.toLocal());

    return Container(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 0, bottom: 4),
      child: Align(
        alignment: (isMe ? Alignment.topRight : Alignment.topLeft),
        child: Column(
          crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              margin: isMe? const EdgeInsets.only(left: 70) : const EdgeInsets.only(right: 70),
              decoration: BoxDecoration(
                borderRadius: isMe
                    ? const BorderRadius.only(
                  bottomRight: Radius.circular(4),
                  bottomLeft: Radius.circular(14),
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(14),)
                    : const BorderRadius.only(
                  bottomRight: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(4),),

                // borderRadius: BorderRadius.circular(20),
                color: (isMe ?  AppColors.primaryColor.withOpacity(0.20)  :  AppColors.themeColor),
              ),
              padding: const EdgeInsets.only(top: 8,bottom: 8, left: 12, right: 12),
              child: Text(
                message,
                  style: const FontData().montFont500WhiteTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                " ${ ""+ formattedTime.toString()} ",

                // " ${date + " " + formattedTime.toString()} ",
                  style: const FontData().montFont40012greyTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }


}
