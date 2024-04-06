import 'package:flutter/material.dart';
import 'package:leetcodestats/Utils/Google/google_database.dart';
import 'package:leetcodestats/Utils/constants.dart';
import 'package:leetcodestats/Utils/sqlHelper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddUser extends StatefulWidget {
	const AddUser({super.key});

	@override
	State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

	TextEditingController name=TextEditingController();
	TextEditingController leetcode=TextEditingController();
	TextEditingController codeforces=TextEditingController();
	TextEditingController codechef=TextEditingController();

	@override
	void initState() {
		// TODO: implement initState
		super.initState();
		name.text="";
		leetcode.text="";
		codeforces.text="";
		codechef.text="";
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Constants.foregroundColor,
				title: Text("Add Friend",style: TextStyle(color: Constants.foregroundColorText)),),
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
						onPressed: ()=>addData(),
						child: Text("Add",style: TextStyle(color: Constants.foregroundColorText)),
						style : ButtonStyle(
							backgroundColor : MaterialStateProperty.all(Constants.foregroundColor)
							)
						)
					],
					)
				),
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

	Future<void> addData() async{
		if(name.text.length==0) {
			Fluttertoast.showToast(msg: "Enter name of user");
			print("empty name");
			return;
		}
		// await SqlHelper.create_user(name.text, leetcode.text, codeforces.text, codechef.text);
		// Fluttertoast.showToast(msg: "User Added");
		// print("added");

		String friendId=DateTime.now().millisecondsSinceEpoch.toString(); //will be used as unique id for friends
		Map<String ,dynamic> data={
			"name":name.text,
			"friendId":friendId,
			"leetcode":leetcode.text,
			"codeforces":codeforces.text,
			"codechef":codechef.text
		};
		await GoogleDatabase.addFriend(data, friendId);
		Navigator.pop(context);
	}
}

