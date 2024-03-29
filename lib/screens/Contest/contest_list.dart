import 'package:flutter/material.dart';
import 'package:leetcodestats/Utils/Components/platformCard.dart';
import 'package:leetcodestats/Utils/constants.dart';
import 'package:leetcodestats/screens/Contest/contest_display.dart';

class ContestList extends StatefulWidget {
	const ContestList({super.key});

	@override
	State<ContestList> createState() => _ContestListState();
}

class _ContestListState extends State<ContestList> {

	List<PlatformCard> platforms=[
					PlatformCard(
		            "Leetcode",
		            ContestScreen(platform: "leetcode",),
		            "images/leetcode.png"),

					PlatformCard(
		            "Codeforces",
		            ContestScreen(platform: "codeforces",),
		            "images/codeforces.png"),
					
					PlatformCard(
		            "Codechef",
		            ContestScreen(platform: "codechef",),
		            "images/codechef.png"),

		            PlatformCard(
		            	"Atcoder",
		            	ContestScreen(platform: "atcoder",),
		            	"images/atcoder.png"
		            	)
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
