import 'package:flutter/material.dart';
import 'package:leetcodestats/Utils/constants.dart';

// ignore: must_be_immutable
class PlatformCard extends StatelessWidget {
	//BuildContext context;
	String title;
	Widget goTo;
  String imagePath;
  	PlatformCard(this.title,this.goTo,this.imagePath);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => goTo));
            },
          child : Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              ),
            color: Constants.foregroundColor,
            
            child: Column(
              children: [
                Padding(
                  padding : EdgeInsets.only(left : 10,top : 10),
                    child : Align(
                      alignment : Alignment.topLeft,
                      child : Text(title,
                        style : TextStyle(fontSize : 20,color : Constants.foregroundColorText)
                      ),
                      
                    ),
                  ),
                Spacer(),
                Align(
                  alignment : Alignment.bottomRight,
                  child : Image.asset(
                      imagePath,
                      height : MediaQuery.of(context).size.height*0.09,
                      width : MediaQuery.of(context).size.width*0.25
                  )
                )
              ],
            ),
          )
      );
  }
}

