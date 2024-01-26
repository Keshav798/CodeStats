import 'package:flutter/material.dart';
import 'package:leetcodestats/Modal/Profiles/codechef_modal.dart';
import 'package:leetcodestats/Utils/apiHelper.dart';
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
			return Center(child : Container(child : Text("Username not yet added")));
		}
		return Scaffold(
			appBar: AppBar(title: Text("Codechef"),),
			body: FutureBuilder<CodeChef>(
				future: ApiHelper.getCodechefData(widget.username),
				builder: (context, snapshot){
					if(snapshot.hasData==false){
						return Center(child : Container(child : CircularProgressIndicator()));
						}else if(snapshot.hasError){
							return Center(child : Container(child : Text(snapshot.error.toString())));
							}else{
								CodeChef data=snapshot.data!;
								return Column(
									children: [
									Image(image: NetworkImage(data.profile.toString()),),
									Text(data.name.toString()),
									
									],
									);
							}
						}
						),
			);
	}
}
