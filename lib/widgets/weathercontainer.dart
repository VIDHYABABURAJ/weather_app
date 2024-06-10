import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherContainer extends StatelessWidget {
  List<String> day;
  String imgs;
  // String tem;
  WeatherContainer({
    super.key,required this.imgs,
    //required this.tem,
    required this.day
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 100,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('ee', style:
              TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Image(
              image: AssetImage(imgs),width: 50,height: 50,),
            Text(day[0], style: TextStyle(
                color: Colors.white, fontSize: 20),
            ),
          ]),
    );
  }
}