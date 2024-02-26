import 'package:front_end_flutter/models/translation.dart';
import 'package:front_end_flutter/models/translation_list.dart';

class Message {
  final int id;
  final String content;
  final List<Translation> translations;
 
  Message(this.id, this.content, this.translations);

  factory Message.fromJson(Map<String, dynamic> json) {
    var id = json['id'] as int;
    var content = json['content'] as String;
    // returns a map from the server : map of translations
    var messageTranslationsListDynamic =
        json['translations']; // returns List<dynamic>

    TranslationList translationList =
        TranslationList.fromJson(messageTranslationsListDynamic);
    return Message(id, content, translationList.translations);
  }
}
