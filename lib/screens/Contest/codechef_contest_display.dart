import 'package:flutter/material.dart';
import 'package:leetcodestats/Modal/Contests/codechef_contest_modal.dart';
import 'package:leetcodestats/Utils/apiHelper.dart';
class CodechefContestScreen extends StatefulWidget {
  const CodechefContestScreen({super.key});

  @override
  State<CodechefContestScreen> createState() => _CodechefContestScreenState();
}

class _CodechefContestScreenState extends State<CodechefContestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    		appBar: AppBar(title: Text("Codechef"),),
    		body: FutureBuilder<CodeChefContest>(
    			future: ApiHelper.getCodechefContests(),
    			builder: (context, snapshot){
    				if(snapshot.hasData==false){
    					return Center(child : Container(child : CircularProgressIndicator()));
					}else if(snapshot.hasError){
						return Center(child : Container(child : Text(snapshot.error.toString())));
					}else{
						CodeChefContest data=snapshot.data!;
						return Column(
							children: [
								Center(child : Container(child : Text(data.lastUpdated.toString())))
							],
							);
					}
    			}
    			),
    	);
  }
}