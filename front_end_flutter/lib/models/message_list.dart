
import 'package:front_end_flutter/models/message.dart';

class MessageList{
  List<Message> messages;
  MessageList(this.messages);
  factory MessageList.fromJson(List<dynamic> json){
      List<Message> messages = [];
      messages = json.map((i)=>Message.fromJson(i)).toList();
      return MessageList(messages);
  }
}