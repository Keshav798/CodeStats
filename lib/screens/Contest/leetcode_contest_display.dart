import 'package:leetcodestats/Utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:leetcodestats/Modal/Contests/leetcode_contest_modal.dart';
import 'package:leetcodestats/Utils/apiHelper.dart';
import 'dart:core';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leetcodestats/Utils/notification_helper.dart';
class LeetcodeContestScreen extends StatefulWidget {
	const LeetcodeContestScreen({super.key});

	@override
	State<LeetcodeContestScreen> createState() => _LeetcodeContestScreenState();
}

class _LeetcodeContestScreenState extends State<LeetcodeContestScreen> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Constants.foregroundColor,
				title: Text("Leetcode"),),
			backgroundColor: Constants.backgroundColor,
			body: FutureBuilder<LeetcodeContest>(
				future: ApiHelper.getLeetcodeContests(),
				builder: (context, snapshot){
					if(snapshot.hasData==false){
						return Center(child : Container(child : CircularProgressIndicator()));
						}else if(snapshot.hasError){
							return Center(child : Container(child : Text(snapshot.error.toString())));
							}else{
								LeetcodeContest leetcodeContest=snapshot.data!;
								List<Data>? list=leetcodeContest.data;
								return ListView.builder(
									itemCount: list!.length,
									itemBuilder: (context, index) {
										Data data=list[index];
										String dateTimeString = data.startTime.toString();
										DateTime dateTimeUtc = DateTime.parse(dateTimeString);
										DateTime dateTimeIndian = dateTimeUtc.add(Duration(hours: 5 ,minutes: 30));
										DateTime dateTimeSchedule = dateTimeUtc.subtract(Duration(minutes: 30));
										DateTime currDate=DateTime.now().toUtc();

										return Card(
											elevation: 5.0, // Set the elevation as needed
											shape: RoundedRectangleBorder(
												borderRadius: BorderRadius.circular(12.0), // Set the border radius
												),
											color: Constants.foregroundColor, 
											child: ListTile(
												title: Text(data.title.toString()),
												leading: GestureDetector(
													onTap: () async{
														if(dateTimeUtc.isBefore(currDate)){
															Fluttertoast.showToast(msg: "Contest Over");
															return;
														}
														var result=await showDialog<bool>(
															context : context,
															builder: (context) => AlertDialog(
																title : Text(
																	"Notify me.",
																	style : TextStyle(fontSize : 16)
																	),
																content: Text(
																	"You will be notified 30 min before the contest"
																	),
																actions :[
																TextButton(
																	onPressed: ()=> Navigator.pop(context,false),
																	child : Text("Cancel"),
																	),
																TextButton(
																	onPressed: ()=> Navigator.pop(context,true),
																	child : Text("Okay"),
																	)
																]
																),
															);
														if(result==null || !result){
															return;
														}
														int id=DateTime.now().millisecondsSinceEpoch%1000000007;

														LocalNotifications.showScheduleNotification(
															id : id,
															title: data.platform.toString(),
															body: data.title.toString(),
															payload: "payload",
															dateTime: dateTimeSchedule
															);

														Fluttertoast.showToast(msg: "Notifocation set");
														},
														child: Icon(
															Icons.notification_add
															),
														),
												subtitle: Text("Start : "+dateTimeIndian.hour.toString()+":0"+dateTimeIndian.minute.toString()+" "+dateTimeIndian.day.toString()+"/"+dateTimeIndian.month.toString()+"/"+dateTimeIndian.year.toString()),
												trailing: GestureDetector(
													onTap: (){
														final Uri _url = Uri.parse(data.url??"https://leetcode.com/contest/");
														launchUrl(_url);
														},
														child: Icon(Icons.link),
														),
												),
											);
									}
									);
							}
						}
						),
			);
	}
}