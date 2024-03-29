// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:leetcodestats/Utils/constants.dart';
import 'package:leetcodestats/screens/Contest/contest_list.dart';
import 'package:leetcodestats/screens/Users/user_list.dart';

class BottomBar extends StatefulWidget {
   BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}
 
class _BottomBarState extends State<BottomBar> {
	int currentIndex=0;
	List<Widget> screens=[UserList(),ContestList()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
		body: IndexedStack(
			index: currentIndex,
			children: screens,
		),
		bottomNavigationBar: NavigationBar(
			backgroundColor: Constants.foregroundColor,
			indicatorColor: Colors.blue,
			destinations: [
				NavigationDestination(icon: Icon(Icons.person,color: Constants.foregroundColorText,), label: "Freinds"),
				NavigationDestination(icon: Icon(Icons.list,color: Constants.foregroundColorText,), label:"Contests"),
			],
			selectedIndex: currentIndex,
			onDestinationSelected: (value) => setState(() {
						  currentIndex=value;
						}),
			)
	);
  }
}