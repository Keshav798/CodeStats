import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GoogleDatabase{

  static final userId=FirebaseAuth.instance.currentUser?.uid;

  static Future addFriend(Map<String, dynamic> data,String friendId) async{
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("friends")
        .doc(friendId)
        .set(data);
    Fluttertoast.showToast(msg: "User Added");
  }

  static Future updateFriend(Map<String, dynamic> data,String friendId) async{
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("friends")
        .doc(friendId)
        .update(data);
    Fluttertoast.showToast(msg: "User Updated");
  }

  static Future<Stream<QuerySnapshot>> getFriends() async{
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("friends").snapshots();
  }

  static Future deleteFriend(String friendId) async{
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("friends")
        .doc(friendId).delete();
    Fluttertoast.showToast(msg: "User Deleted");
  }
}