

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TxtWidget extends StatelessWidget {
  String txt;
 TxtWidget({
    super.key,required this.txt
  });

  @override
  Widget build(BuildContext context) {
    return Text(txt,
      style: TextStyle(color: Colors.white, fontSize: 25),
    );
  }
}
//"Max: 24°"