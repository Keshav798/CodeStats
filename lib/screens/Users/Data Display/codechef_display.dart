import 'package:flutter/material.dart';
import 'package:leetcodestats/Modal/Profiles/codechef_modal.dart';
import 'package:leetcodestats/Utils/apiHelper.dart';
import 'package:leetcodestats/Utils/constants.dart';
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
				body: Center(child : Container(child : Text("Username not yet added"))),
				);
		}
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Constants.foregroundColor,
				title: Text("Codechef"),),
			backgroundColor: Constants.backgroundColor,
			body: FutureBuilder<CodeChef>(
				future: ApiHelper.getCodechefData(widget.username),
				builder: (context, snapshot){
					if(snapshot.hasData==false){
						return Center(child : Container(child : CircularProgressIndicator()));
						}else if(snapshot.hasError){
							return Center(child : Container(child : Text(snapshot.error.toString())));
							}else{
								CodeChef data=snapshot.data!;
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
														crossAxisAlignment: CrossAxisAlignment.center,
														children: [
														SizedBox(height: 16),
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
															style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
															),
														SizedBox(height: 16),
														RatingCard(
															label: "Current Rating",
															value: "${data.currentRating}",
															),
														RatingCard(
															label: "Highest Rating",
															value: "${data.highestRating}",
															),
														SizedBox(height: 24),
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
																style: TextStyle(fontSize: 18, color: Colors.white),
																),
															],
															),
														SizedBox(height: 8),
														RankCard(
															label: "Global Rank",
															value: "${data.globalRank}",
															),
														RankCard(
															label: "Country Rank",
															value: "${data.countryRank}",
															),
														SizedBox(height: 24),
														Row(
															mainAxisAlignment: MainAxisAlignment.center,
															children: [
															Text(
																"Stars: ",
																style: TextStyle(fontSize: 18, color: Colors.white),
																),
															Row(
																children: List.generate(
																	4,
																	//int.parse(data.stars??"0".substring(0,1)),
																	(index) => StarIcon(),
																	),
																),
															],
															),
														SizedBox(height: 16),
														],
														),
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



class RatingCard extends StatelessWidget {
	final String label;
	final String value;

	RatingCard({required this.label, required this.value});

	@override
	Widget build(BuildContext context) {
		return Card(
			elevation: 5,
			shape: RoundedRectangleBorder(
				borderRadius: BorderRadius.circular(15),
				),
			color: Colors.deepPurpleAccent,
			child: Padding(
				padding: const EdgeInsets.all(16),
				child: Column(
					children: [
					Text(
						label,
						style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
						),
					SizedBox(height: 8),
					Text(
						value,
						style: TextStyle(fontSize: 18, color: Colors.amber),
						),
					],
					),
				),
			);
	}
}

class RankCard extends StatelessWidget {
	final String label;
	final String value;

	RankCard({required this.label, required this.value});

	@override
	Widget build(BuildContext context) {
		return Card(
			elevation: 5,
			shape: RoundedRectangleBorder(
				borderRadius: BorderRadius.circular(15),
				),
			color: Colors.deepPurpleAccent,
			child: Padding(
				padding: const EdgeInsets.all(16),
				child: Column(
					children: [
					Text(
						label,
						style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
						),
					SizedBox(height: 8),
					Text(
						value,
						style: TextStyle(fontSize: 18, color: Colors.amber),
						),
					],
					),
				),
			);
	}
}

class StarIcon extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Icon(
			Icons.star,
			color: Colors.amber,
			size: 24,
			);
	}
}






