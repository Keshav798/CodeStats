import 'dart:async';

import 'package:flutter/material.dart';
import 'package:leetcodestats/Utils/Components/gradientText.dart';
import 'package:leetcodestats/Utils/constants.dart';
class AnimatedRatingCard extends StatefulWidget {
	final String label;
	final String value;
  AnimatedRatingCard({required this.label, required this.value});

  @override
  State<AnimatedRatingCard> createState() => _AnimatedRatingCardState();
}

class _AnimatedRatingCardState extends State<AnimatedRatingCard> {

	int index=0;
	List<Color> colors=[Colors.purple,Colors.indigo,Colors.blue,Colors.green,Colors.yellow,Colors.orange,Colors.red];
	Duration duration=const Duration(seconds: 1);
	Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _timer=Timer.periodic(duration, (timer) { 
    	index=(index+1)%colors.length;
    	if(mounted){
    		setState(() {
    		    		  
    		    		});
    	}
    	});
  }

  @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
      _timer?.cancel();
    }
  @override
  Widget build(BuildContext context) {
		double height=MediaQuery.of(context).size.height;
		double width=MediaQuery.of(context).size.width;
		return Container(
			height: height*0.15,
			width: width*0.45,
			decoration : BoxDecoration(
				gradient: LinearGradient(
	      	begin: Alignment.topCenter,
	      	end: Alignment.bottomCenter,
	      	colors: [
	      		Constants.foregroundColor!,
	      		Colors.black,

	      	]),
		      color : Constants.foregroundColor,
		      borderRadius : BorderRadius.all(Radius.circular(30))
		    ),
			child: Padding(
				padding: const EdgeInsets.all(16),
				child: Column(
					children: [
					SizedBox(height: 22),
					GradientText(
						widget.label,
						gradient: LinearGradient(
							begin: Alignment.topLeft,
	      			end: Alignment.bottomRight,
							colors: [Colors.blue,Colors.white]),
						style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Constants.foregroundColorText),
						),
					SizedBox(height: 10),
					GradientText(
						widget.value,
						gradient: LinearGradient(
							begin: Alignment.topLeft,
	      			end: Alignment.bottomRight,
							colors: [Colors.blue,Colors.white]),
						style: TextStyle(fontSize: 24, color: Constants.foregroundColorText),
						),
					],
					),
				),
			);
	}
}