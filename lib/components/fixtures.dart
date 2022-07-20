// Text(
//                                   '${data[index].title}',
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 Text(
//                                   '${data[index].competition}',
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 RichText(
//                                     text: TextSpan(children: [
//                                   TextSpan(
//                                       text: '${data[index].videoEmbed}',
//                                       style: GoogleFonts.lato(
//                                           color: Colors.blue.shade400),
//                                       recognizer: TapGestureRecognizer()
//                                         ..onTap = () {})
//                                 ])),

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scorebat/components/bottomsheet.dart';
import 'package:scorebat/components/key.dart';

import '../utils/texttt.dart';

class MatchBox extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final String competition;
  final String videoUrl;
  final String competitionUrl;
  final String matchviewUrl;

  const MatchBox({
    Key? key,
    required this.thumbnailUrl,
    required this.title,
    required this.competition,
    required this.videoUrl,
    required this.competitionUrl,
    required this.matchviewUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color mycolor = Colors.grey;
    return InkWell(
      onTap: () {
        showMyBottomSheet(context, title, thumbnailUrl, videoUrl, competition,
            competitionUrl, matchviewUrl);
      },
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: mycolor,
            )),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(thumbnailUrl)))),
            ),
            SizedBox(
              height: 5,
            ),
            modifiedText(text: title, size: 16, color: Colors.white),
            SizedBox(
              height: 5,
            ),
            modifiedText(text: competition, size: 12, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
