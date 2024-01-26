import 'package:flutter/material.dart';
import 'package:leetcodestats/Modal/Contests/codeforces_contest_modal.dart';
import 'package:leetcodestats/Utils/apiHelper.dart';
class CodeforcesContestDisplay extends StatefulWidget {
  const CodeforcesContestDisplay({super.key});

  @override
  State<CodeforcesContestDisplay> createState() => _CodeforcesContestDisplayState();
}

class _CodeforcesContestDisplayState extends State<CodeforcesContestDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    		appBar: AppBar(title: Text("Codeforces"),),
    		body: FutureBuilder<CodeforcesContest>(
    			future: ApiHelper.getCodeforcesContests(),
    			builder: (context, snapshot){
    				if(snapshot.hasData==false){
    					return Center(child : Container(child : CircularProgressIndicator()));
					}else if(snapshot.hasError){
						return Center(child : Container(child : Text(snapshot.error.toString())));
					}else{
						CodeforcesContest data=snapshot.data!;
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