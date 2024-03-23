import 'package:flutter/material.dart';
import 'package:leetcodestats/Utils/constants.dart';
import 'package:leetcodestats/Utils/sqlHelper.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: must_be_immutable
class UpdateUser extends StatefulWidget {
	int id;
	UpdateUser(this.id);

	@override
	State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {

	TextEditingController name=TextEditingController();
	TextEditingController leetcode=TextEditingController();
	TextEditingController codeforces=TextEditingController();
	TextEditingController codechef=TextEditingController();

	Future<List<Map<String,dynamic>>> getData() async{
		final data=await SqlHelper.get_user(widget.id);
		return data;
	}

	Future<void> updateData() async{
		if(name.text.length==0) {
			Fluttertoast.showToast(msg: "Name cannot be empty");
			return;
		}
		await SqlHelper.update_user(widget.id, name.text, leetcode.text, codeforces.text, codechef.text);
		Fluttertoast.showToast(msg: "User Updated");
		Navigator.pop(context);
	}

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
				title: Text("Edit",style: TextStyle(color: Constants.foregroundColorText)),),
			backgroundColor: Constants.backgroundColor,
			body: FutureBuilder<List<Map<String,dynamic>>>(
				future: getData(),
				builder: (context, snapshot) {
					if(!snapshot.hasData){
						return Center(child : Container(child : CircularProgressIndicator()));
						}else{
							Map<String,dynamic> data=snapshot.data![0];
							name.text=data["user_name"];
							leetcode.text=data["leetcode"];
							codeforces.text=data["codeforces"];
							codechef.text=data["codechef"];
							return Padding(
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
								);
						}
						}),
			);
	}

	Widget fields(String s1,String s2,TextEditingController cont){
		return Column(
			children: [
			// Align(
			// 	alignment: Alignment.centerLeft,
			// 	child : 	Text(s1)
			// 	),

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