import 'package:flutter/material.dart';
import 'package:leetcodestats/Utils/Google/google_sign_in.dart';
import 'package:leetcodestats/Utils/constants.dart';

import 'direct_page.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Constants.foregroundColor!,Colors.black]
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Welcome",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40,color: Constants.foregroundColorText),
              ),
            ),
            SizedBox(height: 30,),
            GestureDetector(
                onTap: () async {
                  await GoogleSignInHelper.signIn();
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => DirectPage()));
                },
                child: Container(
                  color: Constants.foregroundColor,
                  height: 60,
                  width: 100,
                  child: Center(child: Text("Sign In",style: TextStyle(color: Constants.foregroundColorText),)),
                )
            )
          ],
        ),
      ),
    );
  }
}
