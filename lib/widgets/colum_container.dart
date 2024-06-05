import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColumnContainer extends StatelessWidget {
  String temp;
  String img;
  String time;
   ColumnContainer({
    super.key,required this.img,required this.temp,required this.time
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(temp, style:
            TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        Image(
            image: AssetImage(img)),
        Padding(
          padding: const EdgeInsets.only( left: 10),
          child: Text(time, style: TextStyle(
              color: Colors.white, fontSize: 20),
          ),
        ),
      ]),
    );
  }
}

class WeatherContainer extends StatelessWidget {
  String day;
  String imgs;
  String tem;
  WeatherContainer({
    super.key,required this.imgs,required this.tem,required this.day
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
          child: Text(tem, style:
          TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Image(
            image: AssetImage(imgs),width: 50,height: 50,),
        Text(day, style: TextStyle(
            color: Colors.white, fontSize: 20),
        ),
      ]),
    );
  }
}