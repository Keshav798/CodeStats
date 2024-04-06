import 'package:flutter/material.dart';
import 'package:leetcodestats/Modal/Profiles/codeforces_modal.dart';
import 'package:leetcodestats/Utils/Components/gradientText.dart';
import 'package:leetcodestats/Utils/apiHelper.dart';
import 'package:leetcodestats/Utils/constants.dart';
import 'package:leetcodestats/Utils/widgetRotateHelper.dart';
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
	  double height=MediaQuery.of(context).size.height;
	  double width=MediaQuery.of(context).size.width;
		if(widget.username.isEmpty){
			return Scaffold(
				backgroundColor: Constants.backgroundColor,
				body: Center(child : Container(child : Text("Username not yet added",style: TextStyle(color: Constants.foregroundColorText),))),
				);
		}
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Constants.foregroundColor,
				title: Text("Codeforces",style: TextStyle(color: Constants.foregroundColorText),),),
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
									child: Column(
										children: [
										  
										  Row(
											children: [
											Expanded(
												child: Padding(
													padding: EdgeInsets.all(8),
													child : MovingCardWidget(
														front(data.maxRating.toString(),data.rating.toString(),height,width),
														back(data.maxRank.toString(),height,width)
														)
													)
												),
												],
											),
										
										
										// SizedBox(height : 0.01),
										  
										  Text("Rotate Circle ↕️",style: TextStyle(
										    color: Constants.backgroundColorText,
										    fontSize : 12
										    ),),
										    
										    
										SizedBox(height :20),
										
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
														final Uri _url = Uri.parse("https://codeforces.com/profile/"+widget.username);
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
													onTap: (){
														show=false;
														setState(() {

															});
														},
														child: ListTile(
															title: Text("Recent Contests",style: TextStyle(color: Constants.foregroundColorText),),
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
																title: Text(contests.contest.toString(),style: TextStyle(color: Constants.foregroundColorText),),
																trailing: Column(
																	children : [
																	Text("Contest rank : " + contests.rank.toString(),style: TextStyle(color: Constants.foregroundColorText),),
																	Text("Solved : " + contests.solved.toString(),style: TextStyle(color: Constants.foregroundColorText),),
																	]
																	),
																subtitle: Text("New Rating : " + contests.newRating.toString() + "  " + "Rating Change : " + contests.ratingChange.toString(),style: TextStyle(color: Constants.foregroundColorText),),
																);
														}
														)
													)

												],
												),
										  ),
											
											

										],
														)

);
}
}
),
);
}
}

Widget front(String maxRating,String rating,double height,double width){

	return Container(
			height : height*0.3, //200
			child: Center(
				child : Column(
					crossAxisAlignment: CrossAxisAlignment.center,
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
					GradientText("Max Rating : " + maxRating,
						gradient: LinearGradient(colors: [
							Colors.blue,Colors.white]),
						style: TextStyle(
						  color : Constants.foregroundColorText,
							fontWeight: FontWeight.bold,
							fontSize : 20
							),),
					GradientText("Current Rating : " + rating,
						gradient: LinearGradient(colors: [
							Colors.blue,Colors.white]),
						style: TextStyle(
						  color : Constants.foregroundColorText,
							fontWeight: FontWeight.bold,
							fontSize : 20
							),)
					],
					),
				),
			decoration: BoxDecoration(
			  gradient: LinearGradient(
			colors: [Colors.black, Constants.foregroundColor!],
			begin: Alignment.topCenter,
			end: Alignment.bottomCenter,
			),
				shape: BoxShape.circle,
				),
			);
}

Widget back(String maxRank,double height,double width){
	return Container(
			height : height*0.3,
			child: Center(
				child : Column(
					crossAxisAlignment: CrossAxisAlignment.center,
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
					GradientText(maxRank.toUpperCase(),
						style: TextStyle(
						  color : Constants.foregroundColorText,
							fontWeight: FontWeight.bold,
							fontSize : 30
							),
						gradient: LinearGradient(colors: [
							Colors.blue,Colors.white]),
						),
					],
					),
				),
			decoration: BoxDecoration(
				shape: BoxShape.circle,
				gradient: LinearGradient(
			colors: [Constants.foregroundColor!,Colors.black],
			begin: Alignment.topCenter,
			end: Alignment.bottomCenter,
			),
				),
			);
}


//front(data.maxRating.toString(),data.rating.toString())
//back(data.maxRank.toString(),data.rank.toString()),