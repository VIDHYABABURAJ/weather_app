import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/widgets/colum_container.dart';
import 'package:weather_app/widgets/weather_column.dart';

import '../widgets/txtwidget.dart';

class LocationScreen extends StatefulWidget {
  String weather;
  String min;
  String max;

  LocationScreen({super.key,
    required this.weather,
    required this.max,
    required this.min,

  });

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<String> days=['Sun','Mon','Tue','Wed','Thu','Fri','Sat'];


  // String timeFormat(){
  //   final sunset = widget.sunset;
  //   print("date : $sunset");
  //   DateTime date =  DateTime.fromMillisecondsSinceEpoch(sunset * 1000);
  //   print(date);
  //   String formattedTime = DateFormat('HH:mm').format(date);
  //   print(formattedTime);
  //   return formattedTime;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: AlignmentDirectional.bottomEnd,
                colors: [
                  Color.fromRGBO(157, 82, 172, 0.7),
                  Color.fromRGBO(62, 45, 143, 1),
                ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80,left: 130),
              child: TxtWidget(txt:widget.weather)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TxtWidget(txt:"Max: ${widget.max}°"),
                SizedBox(width: 15,),
                TxtWidget(txt: "Min: ${widget.min}°")
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30 ,left: 20),
              child: Text("7- Days Forecasts",
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23),),
            ),
           SizedBox(height: 10,),

           Container(
             height: 150,
             child: ListView.builder(
               scrollDirection: Axis.horizontal,
               itemCount: days.length,
               itemBuilder: (context, index) {
               return Container(
                 margin: EdgeInsets.only(left: 15),
                   child: WeatherDays(day: days,));
             },),
           ),
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 40,right: 40),
              child: Container(
                height: 200,
                width: 380,
                decoration: BoxDecoration(
                //  boxShadow: BoxShadow(color: Colors.white10),
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                        begin: AlignmentDirectional.bottomEnd,
                        colors: [
                          Color.fromRGBO(62, 45, 143, 1),
                          Color.fromRGBO(157, 82, 172, 0.7),
                        ])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 20),
                          child: Image(image: AssetImage("asset/images/icon _crosshairs_.png")),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 20),
                          child: Text("AIR QUALITY", style: TextStyle(color: Colors.white,fontSize: 20),),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10,left:20),
                      child: Text("3-Low Health Risk", style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30),
                      child: Divider(height: 30,thickness: 5,color: Color.fromRGBO(54, 42, 132, 1),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("See more",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,),padding: EdgeInsets.only(left: 150),)
                      ],
                    )
                  ],
                ),


              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                        gradient: LinearGradient(
                            begin: AlignmentDirectional.bottomEnd,
                            colors: [
                              Color.fromRGBO(157, 82, 172, 0.7),
                              Color.fromRGBO(62, 45, 143, 1),
                            ]),

                        borderRadius: BorderRadius.circular(30)),
                    height: 180,
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20,left: 20),
                              child: Image(image: AssetImage('asset/images/Star 1.png'),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20,left: 5),
                              child: Text("SUNRISE",style: TextStyle(color: Colors.white,fontSize: 20),),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25,top: 10),
                          child: Text("11", style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:20,top: 10),
                          child: Text('Sunset : 11', style: TextStyle(color: Colors.white,fontSize: 18),),
                        )
                      ],
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        gradient: LinearGradient(
                            begin: AlignmentDirectional.bottomEnd,
                            colors: [
                              Color.fromRGBO(157, 82, 172, 0.7),
                              Color.fromRGBO(62, 45, 143, 1),
                            ]),
                        borderRadius: BorderRadius.circular(30)),
                    height: 180,
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20,left: 20),
                              child: Image(image: AssetImage('asset/images/Star 1.png'),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20,left: 5),
                              child: Text("UV INDEX",style: TextStyle(color: Colors.white,fontSize: 18),),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 30),
                          child: Text('4', style: TextStyle(color: Colors.white,fontSize: 30),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text('Moderate', style: TextStyle(color: Colors.white,fontSize: 30,),),
                        ),


                      ],
                    ),


                  ),
                ),
              ],
            ),
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(CupertinoIcons.list_bullet,color: Colors.white,size: 35,),
              padding:EdgeInsets.only(left: 190,top: 20) ,)
          ],
        ),
      ),
    );
  }
}

