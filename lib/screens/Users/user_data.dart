import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.foregroundColor,
        title: Text(user["user_name"]),),
        backgroundColor: Constants.backgroundColor,
      body: Column(
        children: [
        Card(
					elevation: 5.0, // Set the elevation as needed
					shape: RoundedRectangleBorder(
						borderRadius: BorderRadius.circular(12.0), // Set the border radius
						),
					color: Constants.foregroundColor,
					child: ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => LeetcodeScreen(user["leetcode"])));
            },
            title: Text("LeetCode"),
            ),
					),
        SizedBox(height: 10,),
        Card(
					elevation: 5.0, // Set the elevation as needed
					shape: RoundedRectangleBorder(
						borderRadius: BorderRadius.circular(12.0), // Set the border radius
						),
					color: Constants.foregroundColor,
					child: ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CodeforcesScreen(user["codeforces"])));
            },
            title: Text("CodeForces"),
            ),
					),
        SizedBox(height: 10,),
        Card(
					elevation: 5.0, // Set the elevation as needed
					shape: RoundedRectangleBorder(
						borderRadius: BorderRadius.circular(12.0), // Set the border radius
						),
					color: Constants.foregroundColor,
					child: ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CodechefScreen(user["codechef"])));
            },
            title: Text("CodeChef"),
            ),
					),
        SizedBox(height: 10,),
        ],
        ),
      );
  }
}
