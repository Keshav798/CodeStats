import 'package:flutter/material.dart';
import 'package:leetcodestats/Utils/Components/platformCard.dart';
import 'package:leetcodestats/Utils/constants.dart';
import 'package:leetcodestats/screens/Users/Data%20Display/codechef_display.dart';
import 'package:leetcodestats/screens/Users/Data%20Display/codeforces_display.dart';
import 'package:leetcodestats/screens/Users/Data%20Display/leetcode_display.dart';

// ignore: must_be_immutable
class UserData extends StatefulWidget {
  Map<String,dynamic> user_data;
  UserData(this.user_data);
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {

  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> user=widget.user_data;
    List<PlatformCard> platforms=[PlatformCard(
                "Leetcode",
                LeetcodeScreen(user["leetcode"]),
                "images/leetcode.png"
              ),PlatformCard(
                "Codeforces",
                CodeforcesScreen(user["codeforces"]),
                "images/codeforces.png"
              ),PlatformCard(
                "Codechef",
                CodechefScreen(user["codechef"]),
                "images/codechef.png"
              ),];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.foregroundColor,
        title: Text(user["user_name"],style: TextStyle(color: Constants.foregroundColorText)),),
        backgroundColor: Constants.backgroundColor,
      body: GridView.count(
              crossAxisCount: 2,
              childAspectRatio : (1/.7),
              children: platforms
            ),
      );
  }
}
