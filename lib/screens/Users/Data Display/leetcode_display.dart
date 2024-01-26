import 'package:flutter/material.dart';
import 'package:leetcodestats/Modal/Profiles/leetcode_stats_modal.dart';
import 'package:leetcodestats/Utils/apiHelper.dart';
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
		if(widget.username.isEmpty){
			return Center(child : Container(child : Text("Username not yet added")));
		}
		return Scaffold(
			appBar: AppBar(title: Text("Leetcode"),),
			body: FutureBuilder<LeetcodeStats>(
				future: ApiHelper.getLeetcodeData(widget.username),
				builder: (context, snapshot){
					if(snapshot.hasData==false){
						return Center(child : Container(child : CircularProgressIndicator()));
						}else if(snapshot.hasError){
							return Center(child : Container(child : Text(snapshot.error.toString())));
							}else{
								LeetcodeStats data=snapshot.data!;
								return SingleChildScrollView(
									child: Column(
										children: [
										Padding(
											padding: EdgeInsets.all(16),
											child: Card(
												borderOnForeground: true,
												child: Column(
													children: [
													Padding(
														padding: EdgeInsets.all(16),
														child: Text("Solved Problems"),
														),

													Center(child : Padding(
														padding: EdgeInsets.all(16),
														child : Center(
															child : PieChart(
																dataMap: {
																	"Easy": double.parse(data.easyQuestionsSolved.toString()),
																	"Medium": double.parse(data.mediumQuestionsSolved.toString()),
																	"Hard": double.parse(data.hardQuestionsSolved.toString()),
																	},
																	animationDuration: Duration(milliseconds: 1100),
																	chartRadius: 200,
																	centerText: "Beats:" + data.acceptanceRate.toString(),
																	gradientList: [[
																	Color.fromRGBO(54,211,100,1),
																	Color.fromRGBO(129, 250, 112, 1),
																	],
																	[
																	Color.fromRGBO(223, 250, 92, 1),
																	Color.fromRGBO(255,250,80,1),
																	],
																	[
																	Color.fromRGBO(223,27,27,1),
																	Color.fromRGBO(254, 154, 92, 1),
																	]],
																	colorList: [
																	Colors.green,
																	Colors.yellow,
																	Colors.red,
																	],
																	chartType: ChartType.ring,
																	legendOptions: LegendOptions(showLegends: false),
																	chartValuesOptions:ChartValuesOptions(
																		showChartValuesInPercentage: true,
																		chartValueBackgroundColor: Colors.purple
																		),
																	)
															)

														),)



													],
													)
												),
											),
										Row(
											children: [
											card_widget(Colors.red, "Hard", data.hardQuestionsSolved.toString() ,  data.totalHardQuestions.toString(),  data.hardAcceptanceRate.toString()),
											card_widget(Colors.yellow, "Medium", data.mediumQuestionsSolved.toString() ,  data.totalMediumQuestions.toString(),  data.mediumAcceptanceRate.toString()),
											],
											),
										Row(
											children: [
											card_widget(Colors.green, "Easy", data.easyQuestionsSolved.toString() ,  data.totalEasyQuestions.toString(),  data.easyAcceptanceRate.toString()),
											card_widget(Colors.purple, "Total", data.totalProblemsSolved.toString() , "", data.acceptanceRate.toString())
											],
											),
										Row(
											children : [
											Expanded(
												child : Padding(
													padding: EdgeInsets.all(5),
													child: Card(
														child: Padding(
															padding: EdgeInsets.all(10),
															child:Container(
																height: 80,
																width: 130,
																child: Center(
																	child: Text(
																		"Rank : " + data.ranking.toString(),
																		style: TextStyle(
																			fontWeight: FontWeight.bold,
																			),
																		),
																	)
																)
															)
														)
													)
												)
											]
											),
										Padding(
											padding : EdgeInsets.all(10),
											child : Center(
												child : Text("Tap for Profile >")
												)
											)
										
										],
										),
									);
							}
						}
						),
			);
}


}

Widget card_widget(Color color,String display,String solved,String total,String beats){
	return Expanded(
		child : Padding(
			padding: EdgeInsets.all(5),
			child: Card(
				child: Padding(
					padding: EdgeInsets.all(10),
					child:Container(
						height: 80,
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
							Row(
								children: [
								Container(
									width: 10.0, // Set the width of the container
									height: 10.0, // Set the height of the container
									decoration: BoxDecoration(
										shape: BoxShape.circle, // Set the shape to circle
										color: color, // Set the background color
										),
									),
								Text(" "+display)
								],
								),
							(total.isEmpty) ? Text("Solved : "+solved) : Text("Solved : "+solved+"/"+total),
							Text(" Beats : " + beats)
							],
							),
						)
					)
				)
			)
		);
}


