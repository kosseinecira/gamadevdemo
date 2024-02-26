import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          onPressed: null,
          child: Text(AppLocalizations.of(context)!.clickme),
        ),
        // Text Widget for a message...
        const SizedBox(height: 30),
        const Text("The message should appear here...")
      ],
    )));
  }
}




