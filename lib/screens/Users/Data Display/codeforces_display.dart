import 'package:flutter/material.dart';
import 'package:leetcodestats/Modal/Profiles/codeforces_modal.dart';
import 'package:leetcodestats/Utils/apiHelper.dart';
import 'package:leetcodestats/Utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: must_be_immutable
class CodeforcesScreen extends StatefulWidget {
	String username;
	CodeforcesScreen(this.username);

	@override
	State<CodeforcesScreen> createState() => _CodeforcesScreenState();
}

class _CodeforcesScreenState extends State<CodeforcesScreen> {
	
	bool show=false;
	
	@override
	Widget build(BuildContext context) {
		if(widget.username.isEmpty){
			return Scaffold(
				backgroundColor: Colors.deepPurple[800],
				body: Center(child : Container(child : Text("Username not yet added"))),
				);
		}
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Constants.foregroundColor,
				title: Text("Codeforces"),),
			backgroundColor: Constants.backgroundColor,
			body: FutureBuilder<Codeforces>(
				future: ApiHelper.getCodeforcesData(widget.username),
				builder: (context, snapshot){
					if(snapshot.hasData==false){
						return Center(child : Container(child : CircularProgressIndicator()));
						}else if(snapshot.hasError){
							return Center(child : Container(child : Text(snapshot.error.toString())));
							}else{
								Codeforces data=snapshot.data!;
								return SingleChildScrollView(
									child: Container(
										padding: EdgeInsets.all(16),
										child: Card(
											elevation: 10,
											shape: RoundedRectangleBorder(
												borderRadius: BorderRadius.circular(20),
												),
											child: Container(
												decoration: BoxDecoration(
													gradient: LinearGradient(
														colors: [Colors.deepPurple, Colors.indigo],
														begin: Alignment.topCenter,
														end: Alignment.bottomCenter,
														),
													borderRadius: BorderRadius.circular(20),
													),
												child: Padding(
													padding: const EdgeInsets.all(20),
													child: Column(
														children: [
														  Row(
																children: [
																Expanded(
																	child: Padding(
																		padding: EdgeInsets.all(8),
																		child : Container(
																			height : 200,
																			width : 200,
																			child: Center(
																				child : Column(
																					crossAxisAlignment: CrossAxisAlignment.center,
																					mainAxisAlignment: MainAxisAlignment.center,
																					children: [
																					Text("Max Rating : " + data.maxRating.toString(),
																						style: TextStyle(
																							fontWeight: FontWeight.bold,
																							),),
																					Text("Current Rating : " + data.rating.toString(),
																						style: TextStyle(
																							fontWeight: FontWeight.bold,
																							),)
																					],
																					),
																				),
																			decoration: BoxDecoration(
																			  gradient: LinearGradient(
														colors: [Colors.pink, Colors.blue],
														begin: Alignment.topCenter,
														end: Alignment.bottomCenter,
														),
																				shape: BoxShape.circle,
																				),
																			)
																		),
																	),
																Expanded(
																	child: Padding(
																		padding: EdgeInsets.all(8),
																		child : Container(
																			height : 200,
																			width : 200,
																			child: Center(
																				child : Column(
																					crossAxisAlignment: CrossAxisAlignment.center,
																					mainAxisAlignment: MainAxisAlignment.center,
																					children: [
																					Text("Max Rank : " + data.maxRank.toString(),
																						style: TextStyle(
																							fontWeight: FontWeight.bold,
																							),),
																					Text("Current Rank : " + data.rank.toString(),
																						style: TextStyle(
																							fontWeight: FontWeight.bold,
																							),)
																					],
																					),
																				),
																			decoration: BoxDecoration(
																				shape: BoxShape.circle,
																				gradient: LinearGradient(
														colors: [Colors.pink, Colors.blue],
														begin: Alignment.topCenter,
														end: Alignment.bottomCenter,
														),
																				),
																			),
																		)
																	),
																],
																),
															

														if(show==false)
														Card(
															elevation: 5,
															shape: RoundedRectangleBorder(
																borderRadius: BorderRadius.circular(15),
																),
															color: Colors.deepPurpleAccent,
															child: GestureDetector(
																onTap: (){
																	show=true;
																	setState(() {

																		});
																	},
																	child: ListTile(
																		title: Text("Recent Contests"),
																		trailing: Text(">"),
																		),
																	),
															)
														else
														Card(
															elevation: 5,
															shape: RoundedRectangleBorder(
																borderRadius: BorderRadius.circular(15),
																),
															color: Colors.deepPurpleAccent,
															child: Column(
																children: [
																GestureDetector(
																	onTap: (){
																		show=false;
																		setState(() {

																			});
																		},
																		child: ListTile(
																			title: Text("Recent Contests"),
																			trailing: Text("^"),
																			),
																		),
																Container(
																	child : ListView.builder(
																		physics : NeverScrollableScrollPhysics(),
																		shrinkWrap : true,
																		itemCount: data.contests!.length ,
																		itemBuilder: (context,index){
																			Contests contests = data.contests![index];
																			return ListTile(
																				title: Text(contests.contest.toString()),
																				trailing: Column(
																					children : [
																					Text("Contest rank : " + contests.rank.toString()),
																					Text("Solved : " + contests.solved.toString()),
																					]
																					),
																				subtitle: Text("New Rating : " + contests.newRating.toString() + "  " + "Rating Change : " + contests.ratingChange.toString()),
																				);
																		}
																		)
																	)

																],
																),
															),
													Padding(
															padding : EdgeInsets.all(10),
															child : Center(
																child : GestureDetector(
																	onTap: (){
																		final Uri _url = Uri.parse("https://codeforces.com/profile/"+widget.username);
																		launchUrl(_url);
																		},
																		child: Text("Tap for Profile >"),
																		)
																)
															)

														],
														)
),
),
),
),
);
}
}
),
);
}
}


