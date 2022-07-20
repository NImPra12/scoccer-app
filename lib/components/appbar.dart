import 'package:flutter/material.dart';

import '../utils/texttt.dart';

class appbar extends StatelessWidget {
  const appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
      title: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            boldText(
                text: "Sports", size: 20, color: Colors.deepPurple.shade800),
            modifiedText(text: "News", size: 20, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
