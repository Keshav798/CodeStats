import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:leetcodestats/Utils/Google/google_database.dart';
import 'package:leetcodestats/Utils/constants.dart';
import 'package:leetcodestats/Utils/sqlHelper.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: must_be_immutable
class UpdateUser extends StatefulWidget {
	DocumentSnapshot data;
	UpdateUser(this.data);

	@override
	State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {

	TextEditingController name=TextEditingController();
	TextEditingController leetcode=TextEditingController();
	TextEditingController codeforces=TextEditingController();
	TextEditingController codechef=TextEditingController();

	// Future<List<Map<String,dynamic>>> getData() async{
	// 	final data=await SqlHelper.get_user(widget.id);
	// 	return data;
	// }

	Future<void> updateData() async{
		if(name.text.length==0) {
			Fluttertoast.showToast(msg: "Name cannot be empty");
			return;
		}
		// await SqlHelper.update_user(widget.id, name.text, leetcode.text, codeforces.text, codechef.text);
		// Fluttertoast.showToast(msg: "User Updated");
		Map<String,dynamic> newData={
			"name":name.text,
			"friendId":widget.data["friendId"],
			"leetcode":leetcode.text,
			"codeforces":codeforces.text,
			"codechef":codechef.text
		};
		await GoogleDatabase.updateFriend(newData, widget.data["friendId"]);
		Navigator.pop(context);
	}

	@override
	void initState() {
		// TODO: implement initState
		super.initState();
		name.text=widget.data["name"];
		leetcode.text=widget.data["leetcode"];
		codeforces.text=widget.data["codeforces"];
		codechef.text=widget.data["codechef"];
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Constants.foregroundColor,
				title: Text("Edit",style: TextStyle(color: Constants.foregroundColorText)),),
			backgroundColor: Constants.backgroundColor,
			body: Padding(
					padding : EdgeInsets.all(16),
					child : Column(
						//mainAxisAlignment : MainAxisAlignment.center,
						crossAxisAlignment : CrossAxisAlignment.center,
						children: [
							fields("Name","User's name",name),
							fields("Leetcode","Leetcode username",leetcode),
							fields("Codeforces","Codeforces username",codeforces),
							fields("Codechef","Codechef username",codechef),
							ElevatedButton(
									onPressed: ()=>updateData(),
									child: Text("Update",style: TextStyle(color: Constants.foregroundColorText)),
									style : ButtonStyle(
											backgroundColor : MaterialStateProperty.all(Constants.foregroundColor)
									)
							)
						],
					)
			)
			);
	}

	Widget fields(String s1,String s2,TextEditingController cont){
		return Column(
			children: [
			Align(
				alignment: Alignment.centerLeft,
				child : 	Container(
					width: 300,
					child: TextField(
						controller: cont,
						decoration: InputDecoration(
							border: OutlineInputBorder(),
							labelText: s2,
							labelStyle : TextStyle(
							    color : Constants.backgroundColorText
							  )
							),
						style : TextStyle(
							    color : Constants.backgroundColorText
							  )
						),
					)
				),
			SizedBox(height : 20),
			],
			);
	}
}