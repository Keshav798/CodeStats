import 'package:flutter/material.dart';
import 'package:leetcodestats/Modal/Profiles/Leetcode/leetcode_modal_contest.dart';
import 'package:leetcodestats/Modal/Profiles/Leetcode/leetcode_modal_solved.dart';
import 'package:leetcodestats/Utils/apiHelper.dart';
import 'package:leetcodestats/Utils/constants.dart';
import 'package:leetcodestats/Utils/widgetRotateHelper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pie_chart/pie_chart.dart';

// ignore: must_be_immutable
class LeetcodeScreen extends StatefulWidget {
	String username;
	LeetcodeScreen(this.username);

	@override
	State<LeetcodeScreen> createState() => _LeetcodeScreenState();
}

class _LeetcodeScreenState extends State<LeetcodeScreen> {
	@override
	Widget build(BuildContext context) {
		double height=MediaQuery.of(context).size.height;
	  	double width=MediaQuery.of(context).size.width;
		if(widget.username.isEmpty){
			return Scaffold(
				backgroundColor: Constants.backgroundColor,
				body: Center(child : Container(child : Text("Username not yet added"))),
				);
		}
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Constants.foregroundColor,
				title: Text("Leetcode",style: TextStyle(color: Constants.foregroundColorText),),),
			backgroundColor: Constants.backgroundColor,
			body: SingleChildScrollView(
					child: Column(
							children: [
								Row(
									children: [
									Expanded(
										child: Padding(
										padding: EdgeInsets.all(8),
										child : Container(
											child: FutureBuilder<LeetcodeSolved>(
												future: ApiHelper.getLeetcodeSolvedData(widget.username),
												builder: (context,snapshot) {
													if(snapshot.hasData==false){
														return Container(height: height*0.25, width: height*0.25,child : Center(child : Container(child : Center(child: CircularProgressIndicator(),))));
													}else{
														LeetcodeSolved data=snapshot.data!;
														Map<String, double> dataMap = {
													    "Easy: "+data.easySolved!.toString(): data.easySolved!.toDouble(),
													    "Medium: "+data.mediumSolved!.toString(): data.mediumSolved!.toDouble(),
													    "Hard: "+data.hardSolved!.toString(): data.hardSolved!.toDouble(),
													  	};
													  	List<Color> colorList=[Colors.green,Colors.yellow,Colors.red];

													  	return Row(
													  		mainAxisAlignment: MainAxisAlignment.center,
													  		crossAxisAlignment: CrossAxisAlignment.center,
														children: [
														Expanded(
															child: Padding(
																padding: EdgeInsets.all(8),
																child : PieChart(
															      dataMap: dataMap,
															      animationDuration: Duration(milliseconds: 800),
															      chartLegendSpacing: 32,
															      chartRadius: height*0.25,
															      colorList: colorList,
															      initialAngleInDegree: 0,
															      chartType: ChartType.ring,
															      ringStrokeWidth: 20,
															      centerWidget: MovingCardWidget(
															      	Container(
														      			height: height*0.25,
														      			child: Center(
													      					child: Text(
																	      	"Total Solved : "+data.solvedProblem.toString(),
																	      	style: TextStyle(color: Constants.backgroundColorText),
																	      	),
														      				),
														      			decoration: BoxDecoration(
																		  gradient: LinearGradient(
																		colors: [Colors.red, Colors.orange],
																		begin: Alignment.topCenter,
																		end: Alignment.bottomCenter,
																		),
																			shape: BoxShape.circle,
																			),
															      		),
															      	
															      	Container(
														      			height: height*0.25,
														      			child: Center(
													      					child: Text(
													      					"Easy: "+data.easySolved!.toString()+"\n"
													      					"Medium: "+data.mediumSolved!.toString()+"\n"
													      					"Hard: "+data.hardSolved!.toString()+"\n",
																	      	style: TextStyle(color: Constants.backgroundColorText),
																	      	),
														      				),
														      			decoration: BoxDecoration(
																		  gradient: LinearGradient(
																		colors: [Colors.red, Colors.orange],
																		begin: Alignment.topCenter,
																		end: Alignment.bottomCenter,
																		),
																			shape: BoxShape.circle,
																			),
															      		),
															      ),
															      legendOptions: LegendOptions(
															        showLegendsInRow: false,
															        legendPosition: LegendPosition.right,
															        showLegends: false,
															        legendShape: BoxShape.circle,
															        legendTextStyle: TextStyle(
															          color: Constants.backgroundColorText
															        ),
															      ),
															      chartValuesOptions: ChartValuesOptions(
															        showChartValueBackground: false,
															        showChartValues: false,
															        showChartValuesInPercentage: false,
															        showChartValuesOutside: false,
															        decimalPlaces: 0,
															      ),
															      // gradientList: ---To add gradient colors---
															      // emptyColorGradient: ---Empty Color gradient---
															    )
																)
															),
															],
														);
												
													}
													},
											),
										),
										)
										),
										],
									),
					
									Text("Rotate Circle ↕️",style: TextStyle(
									    color: Constants.backgroundColorText,
									    fontSize : 12
									    ),),
								

								Container(
										  height : height*0.07,
										  width : width*0.4, //200
										  decoration : BoxDecoration(
										      color : Constants.foregroundColor,
										      borderRadius : BorderRadius.all(Radius.circular(30))
										    ),
										    child : Padding(
											padding : EdgeInsets.all(10),
											child : Center(
												child : GestureDetector(
													onTap: (){
														final Uri _url = Uri.parse("https://leetcode.com/"+widget.username);
														launchUrl(_url);
														},
														child: Text("Tap for Profile >",style: TextStyle(color: Constants.foregroundColorText),),
														)
												)
											),
										  ),
										  
										  SizedBox(height :20),
										Container(
										  decoration : BoxDecoration(
										      color : Constants.foregroundColor,
										      borderRadius : BorderRadius.only(
										        topRight : Radius.circular(30),
										        topLeft : Radius.circular(30),
										        )
										    ),
										  padding: EdgeInsets.all(0),
										    child : Column(
												children: [
												GestureDetector(
														child: ListTile(
															title: Text("Recent Contests",style: TextStyle(color: Constants.foregroundColorText),),
															),
														),
												Container(
													child : FutureBuilder<LeetcodeContestModal>(
													future: ApiHelper.getLeetcodeContestData(widget.username),
													builder: (context,snapshot) {
														if(snapshot.hasData==false){
															return Container(height: height*0.5, width: height*0.25,child : Center(child : Container(child : Center(child: CircularProgressIndicator(),))));
														}else{
															LeetcodeContestModal data=snapshot.data!;
															data.contestParticipation!.reversed;
															return ListView.builder(
															physics : NeverScrollableScrollPhysics(),
															shrinkWrap : true,
															itemCount: data.contestParticipation!.length ,
															reverse: true,
															itemBuilder: (context,index){
																ContestParticipation contest = data.contestParticipation![index];
																return ListTile(
																	title: Text(contest.contest!.title.toString(),style: TextStyle(color: Constants.foregroundColorText),),
																	trailing: Column(
																		children : [
																		Text("Contest rank : " + contest.ranking.toString(),style: TextStyle(color: Constants.foregroundColorText),),
																		Text("Solved : " + contest.problemsSolved.toString()+"/"+contest.totalProblems.toString(),style: TextStyle(color: Constants.foregroundColorText),),
																		]
																		),
																	subtitle: Text("New Rating : " + contest.rating.toString(),style: TextStyle(color: Constants.foregroundColorText),),
																	);
															}
														);
														}
														},
													),
													)

												],
												),
										  ),
							],
						),
				)
		);
}


}




