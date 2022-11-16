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

// EXAMPLE CHATS ON HOME SCREEN
final List<Message> chats = [
  Message(
    sender: ironMan,
    time: '8:00 PM',
    text: 'Hey dude! Even dead I\'m the hero. Love you 3000 guys.',
    unread: true,
  ),
  Message(
    sender: captainAmerica,
    time: '8:02 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
  ),
  Message(
    sender: blackWindow,
    time: '8:08 PM',
    text: 'WOW! this soul world is amazing, but miss you guys.',
    unread: false,
  ),
  Message(
    sender: spiderMan,
    time: '9:05 PM',
    text: 'I\'m exposed now. Please help me to hide my identity.',
    unread: true,
  ),
  Message(
    sender: hulk,
    time: '1:30 PM',
    text: 'HULK SMASH!!',
    unread: false,
  ),
  Message(
    sender: thor,
    time: '12:30 PM',
    text: 'I\'m hitting gym bro. I\'m immune to mortal deseases. Are you coming?',
    unread: false,
  ),
  Message(
    sender: scarletWitch,
    time: '11:30 AM',
    text: 'My twins are giving me headache. Give me some time please.',
    unread: false,
  ),
  Message(
    sender: captainMarvel,
    time: '12:45 AM',
    text: 'You\'re always special to me nick! But you know my struggle.',
    unread: false,
  ),
];

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
    time: '5:30 PM',
    text: 'Hey dude! Event dead I\'m the hero. Love you 3000 guys.',
    unread: true,
  ),






];