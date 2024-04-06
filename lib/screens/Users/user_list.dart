
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:leetcodestats/Utils/Google/google_database.dart';
import 'package:leetcodestats/Utils/Google/google_sign_in.dart';
import 'package:leetcodestats/Utils/constants.dart';
import 'package:leetcodestats/Utils/sqlHelper.dart';
import 'package:leetcodestats/screens/Users/add_user.dart';
import 'package:leetcodestats/screens/Users/edit_user.dart';
import 'package:leetcodestats/screens/Users/user_data.dart';
import 'package:restart_app/restart_app.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../direct_page.dart';
class UserList extends StatefulWidget {
	const UserList({super.key});
	_UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {

	Stream? friendStream;
	getStream() async {
		friendStream=await GoogleDatabase.getFriends();
		setState(() {

		});
	}

	@override
  void initState() {
    // TODO: implement initState
		getStream();
    super.initState();
  }
	// Future<List<Map<String,dynamic>>> getData() async{
	//
	// 	final data=await SqlHelper.get_users();
	// 	//print(data);
	// 	return data;
	// }

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Constants.foregroundColor,
				title: Text(
					"Friends",
					style: TextStyle(color: Constants.foregroundColorText),
					),
				actions: [
					Padding(
					  padding: const EdgeInsets.all(8.0),
					  child: GestureDetector(
					  	onTap: () async {
					  		await GoogleSignInHelper.signOut();
					  		Navigator.pushReplacement(
					  				context, MaterialPageRoute(builder: (context) => DirectPage()));
								Fluttertoast.showToast(msg: "Please restart application after signing out");
					  	},

					  	child: Text("Logout",style: TextStyle(color: Constants.foregroundColorText),),
					  ),
					)
				],
			),
			backgroundColor: Constants.backgroundColor,
			body: Container(
				child: Container(
					child: StreamBuilder(
						stream: friendStream,
						builder: (context, AsyncSnapshot snapshot) {
							if(snapshot.hasData==false){
								return Center(child : Container(child : CircularProgressIndicator()));
								}else{
									//print(snapshot.data!.length);
									return ListView.builder(
										itemCount: snapshot.data.docs.length,
										itemBuilder: (context,index){
											DocumentSnapshot user=snapshot.data.docs[index];
											//DocumentSnapshot is just like Map<K,V> in usage
											return Card(
												elevation: 5.0, // Set the elevation as needed
												shape: RoundedRectangleBorder(
													borderRadius: BorderRadius.circular(12.0), // Set the border radius
													),
												color: Constants.foregroundColor,
												child: ListTile(
													title : Text(user["name"],style: TextStyle(color: Constants.foregroundColorText)),
													onTap: (){
														Navigator.push(context, MaterialPageRoute(builder: (context) => UserData(user)));
														},
														trailing : Wrap(
															spacing : 8,
															children: [
															GestureDetector(
																onTap: () async {
																	var result=await showDialog<bool>(
																		context : context,
																		builder: (context) => AlertDialog(
																			title : Text(
																				"User will be deleted.",
																				style : TextStyle(fontSize : 16)
																				),
																			actions :[
																			TextButton(
																				onPressed: ()=> Navigator.pop(context,false),
																				child : Text("Cancel"),
																				),
																			TextButton(
																				onPressed: ()=> Navigator.pop(context,true),
																				child : Text("Delete"),
																				)
																			]
																			),
																		);
																	if(result==null || !result){
																		return;
																	}
																	// await SqlHelper.delete_user(user["user_id"]);
																	await GoogleDatabase.deleteFriend(user["friendId"]);
																	setState(() {

																		});
																	},
																	child: Icon(Icons.delete,color: Constants.foregroundColorText,),
																	),
															SizedBox(width: 10,),
															GestureDetector(
																onTap: (){
																	Navigator.push(
																		context, MaterialPageRoute(builder: (context) => UpdateUser(user) )).then((value){
																			setState(() {

																				});
																		}
																		);
																		},
																		child: Icon(Icons.edit,color: Constants.foregroundColorText,),
																		)
															],
															)
														)
												);
											});
								}
								}),)

				),
			floatingActionButton: FloatingActionButton(
				backgroundColor: Constants.foregroundColor,
				onPressed: () {
					Navigator.push(
						context, MaterialPageRoute(builder: (context) => AddUser())).then((value){
							setState(() {

								});
						}
						);
						},
						//foregroundColor: Colors.yellow,
						shape: CircleBorder(),
						child: FittedBox(child : Column(
							children: [
							Icon(Icons.add,color: Constants.foregroundColorText,)
							],
							)),
						),
			);
	}
}