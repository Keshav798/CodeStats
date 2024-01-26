import 'package:flutter/material.dart';
import 'package:leetcodestats/Modal/Profiles/codeforces_modal.dart';
import 'package:leetcodestats/Utils/apiHelper.dart';
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
			return Center(child : Container(child : Text("Username not yet added")));
		}
		return Scaffold(
			appBar: AppBar(title: Text("Codeforces"),),
			body: FutureBuilder<Codeforces>(
				future: ApiHelper.getCodeforcesData(widget.username),
				builder: (context, snapshot){
					if(snapshot.hasData==false){
						return Center(child : Container(child : CircularProgressIndicator()));
						}else if(snapshot.hasError){
							return Center(child : Container(child : Text(snapshot.error.toString())));
							}else{
								Codeforces data=snapshot.data!;
								return Padding(
									padding: EdgeInsets.all(8),
									child : SingleChildScrollView(
										child :  Column(
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
																shape: BoxShape.circle,
																color: Colors.purple
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
																color: Colors.purple
																),
															),
														)
													),
												],
												),

											if(show==false)
											GestureDetector(
												onTap: (){
													show=true;
													setState(() {

														});
													},
													child: ListTile(
														title: Text("Recent Contests"),
														trailing: Text(">"),
														),
													)
											else
											Column(
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
											Text("Go to profile")
											
											],
											)
										)
									);
							}
						}
						),
);
}
}