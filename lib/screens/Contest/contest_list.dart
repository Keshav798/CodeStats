import 'package:flutter/material.dart';
import 'package:leetcodestats/Utils/constants.dart';
import 'package:leetcodestats/screens/Contest/codechef_contest_display.dart';
import 'package:leetcodestats/screens/Contest/codeforces_contest_display.dart';
import 'package:leetcodestats/screens/Contest/leetcode_contest_display.dart';

class ContestList extends StatefulWidget {
	const ContestList({super.key});

	@override
	State<ContestList> createState() => _ContestListState();
}

class _ContestListState extends State<ContestList> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Constants.foregroundColor,
				title: Text("Contests"),),
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
							Navigator.push(context, MaterialPageRoute(builder: (context) => LeetcodeContestScreen()));
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
							Navigator.push(context, MaterialPageRoute(builder: (context) => CodeforcesContestDisplay()));
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
							Navigator.push(context, MaterialPageRoute(builder: (context) => CodechefContestScreen() ));
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