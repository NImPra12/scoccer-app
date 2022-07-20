import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scorebat/backend/fetch.dart';
// import 'package:html/parser.dart' show parse;
// import 'package:html/dom.dart';
import 'package:scorebat/backend/models.dart';
import 'package:scorebat/components/appbar.dart';
import 'package:scorebat/components/fixtures.dart';
import 'package:scorebat/components/key.dart';
import 'package:scorebat/utils/texttt.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // late Future<List<SoccerInfo>> objects;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //parsing and gettting the http link from html format using html package

    // var document =
    //     parse('<body>Hello world! <a href="www.html5rocks.com">HTML5 rocks!');
    // print(document.getElementsByTagName('a')[0].attributes['href']);
    // objects = fetchData();
    // print(objects.then((value) {
    //   print(value[70].title);
    // }));
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        child: appbar(),
        preferredSize: Size.fromHeight(50.0),
      ),
      body: Column(
        children: [
          Center(
              child:
                  boldText(text: "LET'S KICK", color: Colors.white, size: 20)),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              width: w,
              child: FutureBuilder<List<SoccerInfo>>(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data!;
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            // print(data[70].title);
                            print(data[70].competitionUrl);
                            return MatchBox(
                                matchviewUrl: data[index].matchviewUrl != null
                                    ? data[index].matchviewUrl
                                    : 'nothing',
                                competitionUrl:
                                    data[index].competitionUrl != null
                                        ? data[index].competitionUrl
                                        : 'nothing',
                                videoUrl: data[index].videoEmbed,
                                thumbnailUrl: data[index].thumbnail != null
                                    ? data[index].thumbnail
                                    : Constants.imageUrl,
                                title: data[index].title,
                                competition: data[index].competition);
                          });
                    } else {
                      return Center(
                          child:
                              CircularProgressIndicator(color: Colors.white));
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
