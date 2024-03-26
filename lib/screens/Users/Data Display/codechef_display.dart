import 'package:flutter/material.dart';
import 'package:leetcodestats/Modal/Profiles/codechef_modal.dart';
import 'package:leetcodestats/Utils/Components/ratingCard.dart';
import 'package:leetcodestats/Utils/apiHelper.dart';
import 'package:leetcodestats/Utils/constants.dart';
import 'package:leetcodestats/Utils/widgetRotateHelper.dart';
import 'package:card_slider/card_slider.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: must_be_immutable
class CodechefScreen extends StatefulWidget {
	String username;
	CodechefScreen(this.username);

	@override
	State<CodechefScreen> createState() => _CodechefScreenState();
}

class _CodechefScreenState extends State<CodechefScreen> {
	@override
	Widget build(BuildContext context) {
		if(widget.username.isEmpty){
			return Scaffold(
				backgroundColor: Constants.backgroundColor,
				body: Center(child : Container(child : Text("Username not yet added",style: TextStyle(color: Constants.backgroundColorText),))),
				);
		}
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Constants.foregroundColor,
				title: Text("Codechef",style: TextStyle(color: Constants.foregroundColorText),),),
			backgroundColor: Constants.backgroundColor,
			body: FutureBuilder<CodeChef>(
				future: ApiHelper.getCodechefData(widget.username),
				builder: (context, snapshot){
					if(snapshot.hasData==false){
						return Center(child : Container(child : CircularProgressIndicator()));
						}else if(snapshot.hasError){
							return Center(child : Container(child : Text(snapshot.error.toString())));
							}else{
								double height=MediaQuery.of(context).size.height;
	  							double width=MediaQuery.of(context).size.width;
								CodeChef data=snapshot.data!;
								List<Widget> valuesWidget = [AnimatedRatingCard(
                                                label: "Current Rating",
                                                value: "${data.currentRating}",
                                                ),AnimatedRatingCard(
                                                label: "Highest Rating",
                                                value: "${data.highestRating}",
                                                ),AnimatedRatingCard(
                                                label: "Global Rank",
                                                value: "${data.globalRank}",
                                                ), 
                                                AnimatedRatingCard(
                                                label: "Country Rank",
                                                value: "${data.countryRank}",
                                                )];
								return SingleChildScrollView(
									child: Column(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
										Container(
											width: double.infinity,
										  decoration : BoxDecoration(
										      color : Constants.foregroundColor,
										      gradient: LinearGradient(
										      	begin: Alignment.topCenter,
										      	end: Alignment.bottomCenter,
										      	colors: [
										      		Constants.foregroundColor!,
										      		Colors.yellow,
										      		Colors.red,

										      	]),
										      borderRadius : BorderRadius.only(
										        bottomRight : Radius.circular(30),
										        bottomLeft : Radius.circular(30),
										        )
										    ),
										  padding: EdgeInsets.all(0),
										    child : Column(
										    		children: [
										    			Container(
														width: 120,
														height: 120,
														decoration: BoxDecoration(
															shape: BoxShape.circle,
															border: Border.all(color: Colors.white, width: 4),
															image: DecorationImage(
																image: NetworkImage(data.profile??""),
																fit: BoxFit.cover,
																),
															),
														),
													SizedBox(height: 16),
													Text(
														data.name??"",
														style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Constants.foregroundColorText),
														),
													SizedBox(height: 8),

													Row(
														mainAxisAlignment: MainAxisAlignment.center,
														children: [
														Image.network(
															data.countryFlag??"",
															height: 40,
															width: 40,
															),
														SizedBox(width: 8),
														Text(
															"Country: ${data.countryName}",
															style: TextStyle(fontSize: 18, color: Constants.foregroundColorText),
															),
														],
														),

													SizedBox(height: 8),
													Row(
														mainAxisAlignment: MainAxisAlignment.center,
														children: [
														Text(
															"Stars: ${data.stars.toString()}",
															style: TextStyle(fontSize: 18, color: Colors.white),
															),
														],
														),
													SizedBox(height: 16),
										    		],
										    	)

										    ),
										SizedBox(height: 24),
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
														final Uri _url = Uri.parse("https://www.codechef.com/users/"+widget.username);
														launchUrl(_url);
														},
														child: Text("Tap for Profile >",style: TextStyle(color: Constants.foregroundColorText),),
														)
												)
											),
										  ),
										CardSlider(
									        cards: valuesWidget,
									        bottomOffset: .0005,
									        cardHeight: 0.4,
									        cardWidth: 0.6,
									        itemDotOffset: 0.25,
									        containerHeight: 300,
									      ),
																				],
										),
									);
							}
						}
						),
			);
	}
}











