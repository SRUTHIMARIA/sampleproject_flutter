import 'package:cloud_firestore/cloud_firestore.dart';

import '../../utils/constants/firebase_constants.dart';


class MessageChat {
  String idFrom;
  String idTo;
  int timestamp;
  String content;

  MessageChat({
    required this.idFrom,
    required this.idTo,
    required this.timestamp,
    required this.content,
  });

  Map<String, dynamic> toJson() {

    return {
      FirestoreConstants.idFrom: idFrom,
      FirestoreConstants.idTo: idTo,
      FirestoreConstants.timestamp: timestamp,
      FirestoreConstants.content: content,
    };
  }

  factory MessageChat.fromDocument(DocumentSnapshot doc) {
    String idFrom = doc.get(FirestoreConstants.idFrom);
    String idTo = doc.get(FirestoreConstants.idTo);
    int timestamp = doc.get(FirestoreConstants.timestamp);
    String content = doc.get(FirestoreConstants.content);

    return MessageChat(idFrom: idFrom, idTo: idTo, timestamp: timestamp, content: content, );
  }
}
