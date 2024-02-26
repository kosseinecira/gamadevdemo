import 'dart:io';
// English is supported by default, so don't add it to the list.
var supportedLanguages = ['ar','es'];
// getting systemCurrentLanguage used.
var systemLanguage = Platform.localeName.split('_')[0];
// checking wether the system language is supported or not.
isSupportedLanguage(String syslanguage){
  return supportedLanguages.contains(syslanguage);
}