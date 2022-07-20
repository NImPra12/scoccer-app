import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scorebat/utils/texttt.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void showMyBottomSheet(
    BuildContext context,
    String title,
    String imageUrl,
    String url,
    String competition,
    String competitionUrl,
    String matchViewUrl) {
  showBottomSheet(
      backgroundColor: Colors.black,
      context: context,
      builder: (context) {
        return MyBottomSheetLayout(
          title: title,
          thumbnailUrl: imageUrl,
          videoUrl: url,
          competition: competition,
          competitionUrl: competitionUrl,
          matchViewUrl: matchViewUrl,
        );
      });
}

class MyBottomSheetLayout extends StatelessWidget {
  final String title;
  final String thumbnailUrl;
  final String videoUrl;
  final String competition;
  final String competitionUrl;
  final String matchViewUrl;

  const MyBottomSheetLayout({
    Key? key,
    required this.thumbnailUrl,
    required this.videoUrl,
    required this.title,
    required this.competition,
    required this.competitionUrl,
    required this.matchViewUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            child: IconButton(
                onPressed: () {
                  _launchUrl(videoUrl);
                },
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 50,
                )),
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(thumbnailUrl))),
          ),
          SizedBox(
            height: 20,
          ),
          boldText(text: title, size: 20, color: Colors.white),
          SizedBox(
            height: 20,
          ),
          modifiedText(text: competition, size: 16, color: Colors.white),
          SizedBox(
            height: 40,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  boldText(
                      text: "Competiton",
                      size: 25,
                      color: Colors.deepPurple.shade800),
                  SizedBox(
                    width: 5,
                  ),
                  modifiedText(
                      text: "Description", size: 25, color: Colors.white),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    _launchUrl(competitionUrl);
                  },
                  child: modifiedText(
                      text: competitionUrl, size: 15, color: Colors.blue)),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  boldText(
                      text: "Match",
                      size: 25,
                      color: Colors.deepPurple.shade800),
                  SizedBox(
                    width: 5,
                  ),
                  modifiedText(
                      text: "Description", size: 25, color: Colors.white),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    _launchUrl(matchViewUrl);
                  },
                  child: modifiedText(
                      text: matchViewUrl, size: 15, color: Colors.blue)),
            ],
          ))
        ],
      ),
    );
  }

  _launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.inAppWebView);
    } else {
      throw 'Could not launch Url $url';
    }
  }
}
