class Translation {
  final int id;
  final int messageId;
  final String language;
  final String translatedContent;

  Translation(this.id, this.messageId, this.language, this.translatedContent);

  factory Translation.fromJson(Map<String, dynamic> json) {
    var id = json['id'] as int;
    var messageId = json['messageId'] as int;
    var language = json['language'] as String;
    var translatedContent = json['translatedContent'] as String;
    return Translation(id, messageId, language, translatedContent);
  }

}
