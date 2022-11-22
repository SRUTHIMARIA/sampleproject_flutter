
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/models/ChatModel/message_chat.dart';
import 'package:flutter_template/ui/homepage/Chat/chat_session.dart';
import 'package:flutter_template/utils/globals.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class ChatProvider extends ChangeNotifier {
  var isLoggedIn = '';

  final newMessage = TextEditingController();
  int driverId = 0;
  int riderId = 0;
  var timeStamp = 0;
  final controller = ScrollController();
  var from = 'MyId';
  var to = 'otherId';
  var riderName = '';
  bool isTapped = true;
  final databaseReference = FirebaseDatabase.instance.ref();
  final firebaseMessaging = FirebaseMessaging.instance;


  ChatProvider(){
    // driverId = Provider.of<MapsProvider>(Globals.navigatorKey.currentContext!, listen: false).profile!.data.id;
    // from = driverId.toString();
    Future.delayed(Duration.zero).then((_) {
      firebaseMessaging.getToken().then((value) {
        FirebaseDatabase.instance
            .ref()
            .child('tokens/$from')
            .set({
          'token': value,
        });
      });
    });

  }

  void resetMessage(){
    newMessage.text = '';
  }
  void setRider(String name, int id){
    debugPrint('********* chat from to: $id');
    riderName = name;
    to = id.toString();
    notifyListeners();
  }

  void setIsTapped(bool tapped){
    isTapped = tapped;
    notifyListeners();
  }

  void validateMessage(){
    newMessage.text.trim().isEmpty?
    null
        :
    _handleSubmitted();
  }

  void _handleSubmitted() {
    var channelName = '$to:$from';
    dynamic currentTime = DateFormat.jm().format(DateTime.now().toUtc());
   // dynamic date = DateTime.now();
  //  final DateFormat formatter = DateFormat('dd-MM-yyyy');
   // final String formatted = formatter.format(date);

    firestore.collection(channelName).add({
     // 'date': formatted,
      'from': from,
      'time': currentTime,
      'to': to,
      'message': newMessage.text,
      'timestamp' : DateTime.now().millisecondsSinceEpoch,
    }).then((_) {
      newMessage.clear();
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


  Future onSendClicked() async{
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    timeStamp = DateTime.now().millisecondsSinceEpoch;
    MessageChat messageChat = MessageChat(
      idFrom: from,
      idTo: to,
      timestamp: timeStamp,
      content: newMessage.text,
    );
    await docUser.set(messageChat.toJson());
    resetMessage();

  }

}
