import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:front_end_flutter/models/message.dart';
import 'package:front_end_flutter/models/translation.dart';
import 'package:front_end_flutter/utils/supported_languages.dart';
import 'package:front_end_flutter/services/message_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomePage> {
  // a promise to initialize...when call fetchMessage()
  late Message message;
  late Translation translation;
  var msg = "";
  @override
  Widget build(BuildContext context) {
    //Scaffold is a widget in Flutter used to implements the basic material design visual layout structure.

    return Scaffold(
        body: Center(
            child: Column(
      //moving based on Y axis since it's a Column.
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // styled TextButton Widget
        TextButton(
          style: const ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.white),
              backgroundColor: MaterialStatePropertyAll(Colors.blue)),
          onPressed: () {
            fetchMessage(1, systemLanguage);
          },
          child: Text(AppLocalizations.of(context)!.clickme),
        ),
        // Text Widget for a message...
        const SizedBox(height: 30),
        Text(msg)
        ,Text(systemLanguage)
      ],
    )));
  }

  void fetchMessage(int id, String language) async {
    if (isSupportedLanguage(language)) {
      translation =
          await fetchByLanguage(id, language); //returns Translation object.
      setState(() {
        msg = translation.translatedContent;
      });
    } else {
      message = await fetchByLanguageDefault(id); // returns a message object.
      setState(() {
        msg = message.content;
      });
    }
  }
}
