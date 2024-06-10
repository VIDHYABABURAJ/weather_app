import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TxtWidget extends StatelessWidget {
  String txt;
  double fontsize;
 TxtWidget({
    super.key,required this.txt,required this.fontsize
  });

  @override
  Widget build(BuildContext context) {
    return Text(txt,
      style: TextStyle(color: Colors.white, fontSize: fontsize),
    );
  }
}
//"Max: 24°"