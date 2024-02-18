import 'package:flutter/material.dart';
import 'package:leetcodestats/Utils/constants.dart';
import 'package:leetcodestats/Utils/sqlHelper.dart';
import 'package:leetcodestats/screens/Users/add_user.dart';
import 'package:leetcodestats/screens/Users/edit_user.dart';
import 'package:leetcodestats/screens/Users/user_data.dart';
class UserList extends StatefulWidget {
	const UserList({super.key});
	_UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {

	Future<List<Map<String,dynamic>>> getData() async{

		final data=await SqlHelper.get_users();
		//print(data);
		return data;
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Constants.foregroundColor,
				title: Text("Friends"),),
			backgroundColor: Constants.backgroundColor,
			body: Container(
				child: Container(
					child: FutureBuilder<List<Map<String,dynamic>>>(
						future: getData(),
						builder: (context, snapshot) {
							if(snapshot.hasData==false){
								return Center(child : Container(child : CircularProgressIndicator()));
								}else{
									//print(snapshot.data!.length);
									return ListView.builder(
										itemCount: snapshot.data!.length,
										itemBuilder: (context,index){
											Map<String,dynamic> user=snapshot.data![index];

											return Card(
												elevation: 5.0, // Set the elevation as needed
												shape: RoundedRectangleBorder(
													borderRadius: BorderRadius.circular(12.0), // Set the border radius
													),
												color: Constants.foregroundColor,
												child: ListTile(
													title : Text(user["user_name"]),
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
																	await SqlHelper.delete_user(user["user_id"]);
																	setState(() {

																		});
																	},
																	child: Icon(Icons.delete),
																	),
															SizedBox(width: 10,),
															GestureDetector(
																onTap: (){
																	Navigator.push(
																		context, MaterialPageRoute(builder: (context) => UpdateUser(user["user_id"]) )).then((value){
																			setState(() {

																				});
																		}
																		);
																		},
																		child: Icon(Icons.edit),
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
							Icon(Icons.add)
							],
							)),
						),
			);
	}
}