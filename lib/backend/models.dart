/* "response": [
{
"title": "Chelsea - Manchester United",
"competition": "ENGLAND: Premier League",
"matchviewUrl": "...",
"competitionUrl": "...",
"thumbnail": "...",
"date": "2021-05-18T15:00:00+0000",
"videos": [
{
"title": "Highlights",
"embed": "..."
},
{
"title": "Extended Highlights",
"embed": "..."
}
]
},
...*/
import 'package:flutter/foundation.dart';

class SoccerInfo {
  final String title;
  final String competition;
  final String videoEmbed;
  final String thumbnail;
  final String competitionUrl;
  final String matchviewUrl;

  SoccerInfo({
    required this.title,
    required this.competition,
    required this.videoEmbed,
    required this.thumbnail,
    required this.competitionUrl,
    required this.matchviewUrl,
  });

  factory SoccerInfo.fromJson(Map<String, dynamic> json, String videoEm) {
    final titleFromJson = json['title'];
    final competitionFromJson = json['competition'];
    final thumbnailfromJson = json['thumbnail'];
    final videoEmfromFunc = videoEm;
    final compUrlfromJson = json['competitionUrl'];
    final matchViewfromJson = json['matchviewUrl'];

    return SoccerInfo(
      title: titleFromJson,
      competition: competitionFromJson,
      videoEmbed: videoEmfromFunc,
      thumbnail: thumbnailfromJson,
      competitionUrl: compUrlfromJson,
      matchviewUrl: matchViewfromJson,
    );
  }
}
