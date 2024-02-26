import 'package:front_end_flutter/models/message.dart';
import 'package:front_end_flutter/models/translation.dart';
import 'package:front_end_flutter/models/message_list.dart';
import 'package:front_end_flutter/models/translation_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MessageServices {
  final baseUrl = "192.168.1.100:9090";
  final endpoint = "/api/message/";
  final slash = "/";

  void fetchAllMessages() async {
    final httpPackageUrl = Uri.https(baseUrl, endpoint);
    //final httpPackageUrl = Uri.parse("https://192.168.1.100/api/Message");

    //final httpPackageInfo = await http.get(httpPackageUrl,headers: {
    //"Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
    //'Content-Type': 'application/json',
    //'Accept': '*/*'
    //});

    final httpPackageInfo = await http.read(httpPackageUrl);
    final messageMap = json.decode(httpPackageInfo) as List;
    final messageList = MessageList.fromJson(messageMap);
    print(messageList.messages[0].content);
    print(messageList.messages[1].translations[0].translatedContent);
    print("finished............fetchAllmessages");
  }

  Future<Message> fetchByLanguageDefault(int id, String language) async {
    String subendpoint = "";
    subendpoint = endpoint + id.toString() + slash;
    final httpPackageUrl = Uri.https(baseUrl, subendpoint);
    //final httpPackageUrl = Uri.parse("https://192.168.1.100/api/Message");
    final httpPackageResponse = await http.get(httpPackageUrl, headers: {
      "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
      'Content-Type': 'application/json',
      'Accept': '*/*'
    });
    final messageMap = json.decode(httpPackageResponse.body);
    // final httpPackageInfo = await http.read(httpPackageUrl);
    final messageObj = Message.fromJson(messageMap);
    return messageObj;
  }

  Future<Translation> fetchByLanguage(int id, String language) async {
    String subendpoint = "";
    Translation translation;
    subendpoint = endpoint + id.toString() + slash + language;
    final httpPackageUrl = Uri.https(baseUrl, subendpoint);
    //final httpPackageUrl = Uri.parse("https://192.168.1.100/api/Message");
    final httpPackageResponse = await http.get(httpPackageUrl, headers: {
      "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
      'Content-Type': 'application/json',
      'Accept': '*/*'
    });
    final translationMap =
        json.decode(httpPackageResponse.body); //return List<dynamic>
    // final httpPackageInfo = await http.read(httpPackageUrl);
    final translationObj = TranslationList.fromJson(translationMap);
    translation = translationObj.translations.first;
    return translation;
  }
}
