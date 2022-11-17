import 'user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.unread,
  });
}



// EXAMPLE MESSAGES IN CHAT SCREEN
final List<Message> messages = [
  Message(
    sender: ironMan,
    time: '2:00 PM',
    text: 'consectetur adipiscing elit duis\ntristique sollicitudin nibh sit amet\ncommodo nulla facilisi nullam\nvehicula ipsum...',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nulla Lorem mollit cupidatat irure.\nLaborum magna nulla duis ullamco...',
    unread: true,
  ),
  Message(
    sender: ironMan,
    time: '3:15 PM',
    text: 'Malesuada Fermentum Tortor',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Nulla Lorem mollit...',
    unread: true,
  ),


  Message(
    sender: ironMan,
    time: '3:15 PM',
    text: 'Malesuada Fermentum Tortor',
    unread: true,
  ),

  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Nulla Lorem mollit...',
    unread: true,
  ),


  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nulla Lorem mollit cupidatat irure.\nLaborum magna nulla duis ullamco...',
    unread: true,
  ),


];