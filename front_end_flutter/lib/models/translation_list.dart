import 'package:front_end_flutter/models/translation.dart';

class TranslationList{
  List<Translation> translations;
  TranslationList(this.translations);
  factory TranslationList.fromJson(List<dynamic> json){
      List<Translation> translations = [];
      translations = json.map((i)=>Translation.fromJson(i)).toList();
      return TranslationList(translations);
  }
}