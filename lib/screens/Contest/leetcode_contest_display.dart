import 'package:flutter/material.dart';
import 'package:leetcodestats/Modal/Contests/leetcode_contest_modal.dart';
import 'package:leetcodestats/Utils/apiHelper.dart';
class LeetcodeContestScreen extends StatefulWidget {
	const LeetcodeContestScreen({super.key});

	@override
	State<LeetcodeContestScreen> createState() => _LeetcodeContestScreenState();
}

class _LeetcodeContestScreenState extends State<LeetcodeContestScreen> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
    		appBar: AppBar(title: Text("Leetcode"),),
    		body: FutureBuilder<LeetcodeContest>(
    			future: ApiHelper.getLeetcodeContests(), 
    			builder: (context, snapshot){
    				if(snapshot.hasData==false){
    					return Center(child : Container(child : CircularProgressIndicator()));
					}else if(snapshot.hasError){
						return Center(child : Container(child : Text(snapshot.error.toString())));
					}else{
						LeetcodeContest data=snapshot.data!;
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