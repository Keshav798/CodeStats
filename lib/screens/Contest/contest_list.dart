import 'package:flutter/material.dart';
import 'package:leetcodestats/screens/Contest/codechef_contest_display.dart';
import 'package:leetcodestats/screens/Contest/codeforces_contest_display.dart';
import 'package:leetcodestats/screens/Contest/leetcode_contest_display.dart';

class ContestList extends StatefulWidget {
  const ContestList({super.key});

  @override
  State<ContestList> createState() => _ContestListState();
}

class _ContestListState extends State<ContestList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    		appBar: AppBar(title: Text("Contests"),),
    		body: Column(
            children: [
              ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LeetcodeContestScreen()));
                    },
                  title: Text("LeetCode"),
                ),
              SizedBox(height: 10,),
              ListTile(
                  onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CodeforcesContestDisplay()));
                      },
                  title: Text("CodeForces"),
                ),
              SizedBox(height: 10,),
              ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CodechefContestScreen() ));
                    },
                  title: Text("CodeChef"),
                ),
              SizedBox(height: 10,),
            ],
    			),
    	);
  }
}