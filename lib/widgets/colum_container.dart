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
            TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Image(
            image: AssetImage(img),fit: BoxFit.fill,height: 90,),
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

