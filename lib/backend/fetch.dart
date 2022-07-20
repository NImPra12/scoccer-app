import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scorebat/backend/models.dart';
import 'package:scorebat/components/key.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

Future<List<SoccerInfo>> fetchData() async {
  int i;
  String url = 'https://www.scorebat.com/video-api/v3/feed/?token=';
  final response = await http.get(Uri.parse(url + Keyt.apiToken));
  Map result = jsonDecode(response.body);
  // print("fetched");
  // print(result['response']);
  List<SoccerInfo> objects = [];

/* 
attributes iframe vanni lai khojera parsing gareko url matra
taneko

fromJson method ma duita parameter pass gareko duita chuttai tariak le decode 
gareko tara euta index follow garni vayera synchronise huni vayera hamle loop 
lagako length naapera from .length method lagayera


*/

  for (i = result['response'].length - 1; i != 0; i--) {
    var document = parse(result['response'][i]['videos'][0]['embed']);
    String video =
        (document.getElementsByTagName('iframe')[0].attributes['src'])
            .toString();
    objects.add(SoccerInfo.fromJson(result['response'][i], video));
  }
  // var document = parse(result['response'][60]['videos'][0]['embed']);
  // print(document.getElementsByTagName('iframe')[0].attributes['src']);
  // SoccerInfo object = SoccerInfo.fromJson(result['response'][i]);
  // print(objects.length);
  // print(objects[0].title);
  // print(objects[89].title);

  return objects;

  // var document = parse(result['response'][60]['videos'][0]['embed']);
  // print(document.getElementsByTagName('iframe')[0].attributes['src']);
}
