import 'package:flutter/material.dart';
import 'package:leetcodestats/Utils/Components/platformCard.dart';
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

	List<PlatformCard> platforms=[
					PlatformCard(
		            "Leetcode",
		            LeetcodeContestScreen(),
		            "images/leetcode.png"),

					PlatformCard(
		            "Codeforces",
		            CodeforcesContestDisplay(),
		            "images/codeforces.png"),
					
					PlatformCard(
		            "Codechef",
		            CodechefContestScreen(),
		            "images/codechef.png")
		            ];
	@override
	Widget build(BuildContext context) {

		return Scaffold(
			appBar: AppBar(
				backgroundColor: Constants.foregroundColor,
				title: Text("Contests",style: TextStyle(color: Constants.foregroundColorText)),),
			backgroundColor: Constants.backgroundColor,
			body: GridView.count(
		          crossAxisCount: 2,
		          childAspectRatio : (1/.7),
		          children: platforms
		        ),
			);
	}
}
