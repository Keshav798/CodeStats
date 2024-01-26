//userlist code

// class UserList extends StatefulWidget {
//   const UserList({super.key});
//   _UserListState createState() => _UserListState();
// }

// class _UserListState extends State<UserList> {
//   List<String> name = [];
//   List<String> username = [];
//   TextEditingController searchcontrol = TextEditingController();
//   TextEditingController namecontrol = TextEditingController();
//   TextEditingController usernamecontrol = TextEditingController();

//   Future<void> getList() async {
//     name.clear();
// 		username.clear();
//     await SharedPrefHelper.getList(name,username);
//     print("data retrived");
//     //print(name);
//   }

//   void display(String username) {
//     Navigator.push(context,
//       MaterialPageRoute(builder: (context) => UserData(username: username)));
//   }

//   Future<void> delete(String Name, String Username) async {
//     await SharedPrefHelper.deleteuser(Name, Username);
//     Fluttertoast.showToast(msg: "user deleted");
//     setState(() {});
//   }

//   void sendtoUsernameEnter() {
//     Navigator.push(
//       context, MaterialPageRoute(builder: (context) => Username()));
//   }

//   void add(TextEditingController namecontrol,
//       TextEditingController usernamecontrol) async {
//       if (!namecontrol.text.isEmpty && !usernamecontrol.text.isEmpty) {
//         int code=await SharedPrefHelper.add(namecontrol.text, usernamecontrol.text);
//         if(code==-1){ //indiacates user already exist(return code -1)
//           Fluttertoast.showToast(msg: "User already exists");
//           }else{ //return code 0
//             Fluttertoast.showToast(msg: "User added");
//           }
//           setState(() {
//             usernamecontrol.clear();
//             namecontrol.clear();
//             });
//           } else {
//             Fluttertoast.showToast(msg: "Enter all fields");
//           }
//       }

//       Future<bool> _onWillPop() async {
//         Navigator.of(context).pop(true); // app will close
//         return true;
//       }

//       @override
//       Widget build(BuildContext context) {
//         return WillPopScope(
//           //used for overiding back button
//           onWillPop: () => _onWillPop(),
//           child: Scaffold(
//             appBar: AppBar(title: Text("Friend List")),
//             body: Column(children: [
//               SizedBox(
//                 height: 20,
//                 ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   controller: searchcontrol,
//                   onChanged: (value) => setState(() {}),
//                   decoration: InputDecoration(
//                     hintText: "search",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0))),
//                   ),
//                 ),
//               FutureBuilder(
//                 future: getList(),
//                 builder: (context, snapshot) {
//                   if (name.length == 0) {
//                     return Text("No User Found");
//                     } else {
//                       return Container(
//                         height: 210,
//                         width: 400,
//                         child: ListView.builder(
//                           itemCount: name.length,
//                           itemBuilder: (context, index) {
//                             if (name[index].contains(searchcontrol.text)) {
//                               return ListTile(
//                                 onTap: () => display(username[index]),
//                                 onLongPress: () =>
//                                 delete(name[index], username[index]),
//                                 title: Text(name[index]),
//                                 subtitle: Text(username[index]),
//                                 );
//                               } else {
//                                 return Text("");
//                               }
//                               }),
//                         );
//                     }
//                     },
//                     ),
//               SizedBox(
//                 height: 30,
//                 ),
//               Container(
//                 child: Card(
//                   child: Column(children: [
//                     TextFormField(
//                       controller: namecontrol,
//                       decoration: InputDecoration(
//                         hintText: "Name",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)),
//                         ),
//                       ),
//                     SizedBox(
//                       height: 20,
//                       ),
//                     TextFormField(
//                       controller: usernamecontrol,
//                       decoration: InputDecoration(
//                         hintText: "Leetcode Username",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)),
//                         ),
//                       ),
//                     SizedBox(
//                       height: 20,
//                       ),
//                     InkWell(
//                       onTap: () => add(namecontrol, usernamecontrol),
//                       child: Container(
//                         width: 90,
//                         height: 30,
//                         color: Colors.blue,
//                         child: Center(child: Text("Add friend")),
//                         ),
//                       ),
//                     SizedBox(
//                       height: 10,
//                       ),
//                     Center(child: Text("{Long press to delete user}")),
//                     SizedBox(
//                       height: 10,
//                       ),
//                     Center(
//                       child: InkWell(
//                         onTap: () => sendtoUsernameEnter(),
//                         child: Text(
//                           "Find by leetcode username",
//                           style:
//                           TextStyle(decoration: TextDecoration.underline),
//                           )))
//                     ]),
//                   ),
//                 )
//               ]),
//             ),
//           );
//       }
// }





















//user data code

// // ignore: must_be_immutable
// class UserData extends StatefulWidget {
//   String username;
//   UserData({required this.username});
//   _UserDataState createState() => _UserDataState();
// }

// class _UserDataState extends State<UserData> {
//   LeetcodeStats stats = LeetcodeStats();
//   Future<void> getData(LeetcodeStats stats, String username) async {
//     stats=await ApiHelper.getLeetcodeData(username);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Stats")),
//       body: FutureBuilder(
//         //used for future functions
//         future: getData(stats, widget.username),
//         builder: (context, snapshot) {
//           if (stats.status != "success" && stats.status != "error") {
//             return Center(child: Text("loading...."));
//             } else if (stats.status == "error") {
//               return Center(
//                 child: Text(
//                   stats.message.toString() + "...try again",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                   ));
//               } else {
//                 return Column(children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       height: 300,
//                       width: 300,
//                       child: PieChart(
//                         colorList: [
//                         Colors.green,
//                         Colors.yellow,
//                         Colors.red,
//                         ],
//                         chartType: ChartType.ring,
//                         dataMap: {
//                           "Easy": double.parse(stats.easySolved.toString()),
//                           "Medium": double.parse(stats.mediumSolved.toString()),
//                           "Hard": double.parse(stats.hardSolved.toString()),
//                           },
//                           chartValuesOptions:
//                           ChartValuesOptions(showChartValuesInPercentage: true),
//                           )),
//                     ),
//                   Container(
//                     height: 210,
//                     width: 400,
//                     child: Card(
//                       borderOnForeground: true,
//                       child: ListView(scrollDirection: Axis.vertical, children: [
//                         _cardField("Total Solved", stats.totalSolved.toString()),
//                         _cardField("Easy", stats.easySolved.toString()),
//                         _cardField("Medium", stats.mediumSolved.toString()),
//                         _cardField("Hard", stats.hardSolved.toString()),
//                         _cardField(
//                           "Acceptance Rate", stats.acceptanceRate.toString()),
//                         _cardField("Ranking", stats.ranking.toString()),
//                         ]),
//                       ),
//                     ),
//                   SizedBox(
//                     height: 20,
//                     ),
//                   ]);
//               }
//               },
//               ),
//       );
//   }

//   Widget _cardField(String title, String val) {
//     return Column(
//       children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//         Text(" " + title),
//         Text(val + " "),
//         ],
//         ),
//       Divider()
//       ],
//       );
//   }
// }























//shared pref code
// import 'package:shared_preferences/shared_preferences.dart';
// class SharedPrefHelper{

// 	static Future<void> getList(List<String> name,List<String> username) async {
// 		SharedPreferences pref = await SharedPreferences.getInstance();
		
// 		name.clear();
// 		username.clear();
    
//     print(pref.getStringList("name")!);
// 		for (String i in pref.getStringList("name")!) {
// 			name.add(i);
// 		}
// 		for (String i in pref.getStringList("username")!) {
// 			username.add(i);
// 		}
// 	}

// 	static Future<void> deleteuser(String name, String username) async{
// 		SharedPreferences pref = await SharedPreferences.getInstance();
// 		List<String>? n = pref.getStringList("name");
// 		List<String>? u = pref.getStringList("username");
// 		n!.remove(name);
// 		u!.remove(username);
// 		pref.setStringList("name", n);
// 		pref.setStringList("username", u);
// 	}

// 	static Future<int> add(String name, String username) async{
// 		SharedPreferences pref = await SharedPreferences.getInstance();

// 		List<String>? n = pref.getStringList("name");
// 		List<String>? u = pref.getStringList("username");
// 		if (n == null) {
// 			pref.setStringList("name", []);
// 			pref.setStringList("username", []);
// 		}

// 		if(n!.contains(name) || u!.contains(username)){
// 			return -1;
// 			}else{
// 				n.add(name);
// 				u.add(username);
// 			}

// 			pref.setStringList("name", n);
// 			pref.setStringList("username", u);
// 			return 0;

// 		}
// 	}