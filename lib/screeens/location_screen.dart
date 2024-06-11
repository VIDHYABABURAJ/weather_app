import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/widgets/colum_container.dart';
import 'package:weather_app/widgets/weather_column.dart';

import '../widgets/txtwidget.dart';
import '../widgets/weathercontainer.dart';

class LocationScreen extends StatefulWidget {
  String weather;
  String min;
  String max;
  final sunset;
  final sunrise;
  final temp;
  final uv;

  LocationScreen(
      {super.key,
      required this.weather,
      required this.max,
      required this.min,
      required this.sunset,
      required this.sunrise,
      required this.temp,
        required this.uv
      });

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  String timeFormat({required final sun}){
    // final sunset = widget.sunset;
    // print("date : $sunset");
    DateTime date =  DateTime.fromMillisecondsSinceEpoch(sun * 1000);
    print(date);
    String formattedTime = DateFormat('HH:mm a').format(date);
    print(formattedTime);
    return formattedTime;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(begin: AlignmentDirectional.bottomEnd, colors: [
          Color.fromRGBO(157, 82, 172, 0.7),
          Color.fromRGBO(62, 45, 143, 1),
        ])),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Center(
                    child: TxtWidget(
                      txt: widget.weather,
                      fontsize: 40,
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TxtWidget(
                    txt: "Max: ${widget.max}°C",
                    fontsize: 25,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  TxtWidget(
                    txt: "Min: ${widget.min}°C",
                    fontsize: 25,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20),
                child: Text(
                  "7- Days Forecasts",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length,
                  itemBuilder: (context, index) {
                    return Container(
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: AlignmentDirectional.bottomEnd,
                                colors: [
                                  Color.fromRGBO(70, 50, 150, 1),
                                  Color.fromRGBO(142, 110, 210, 1),
                                ]),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child:Container(
          
                          width: 150,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text("${widget.temp.toStringAsFixed(0)}°C", style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                ),
                                Image(
                                  image: AssetImage('asset/images/cloud.png'),width: 50,height: 50,),
                                Text(days[index], style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                ),
                              ]),
                        )
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
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
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: Image(
                                image: AssetImage(
                                    "asset/images/icon _crosshairs_.png")),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: Text(
                              "AIR QUALITY",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: Text(
                          "3-Low Health Risk",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child:LinearProgressIndicator(),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "See more",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.only(left: 150),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
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
                                padding: const EdgeInsets.only(top: 20, left: 20),
                                child: Image(
                                  image: AssetImage('asset/images/Star 1.png'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20, left: 5),
                                child: Text("SUNRISE",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, top: 10),
                            child: Text(timeFormat(sun:widget.sunrise),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Text("Sunset : ${timeFormat(sun:widget.sunset)}",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
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
                                padding: const EdgeInsets.only(top: 20, left: 20),
                                child: Image(
                                  image: AssetImage('asset/images/Star 1.png'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20, left: 5),
                                child: Text(
                                  "UV INDEX",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 30),
                            child: Text(widget.uv.toString(),
                              style: TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              'Moderate',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  CupertinoIcons.list_bullet,
                  color: Colors.white,
                  size: 35,
                ),
                padding: EdgeInsets.only(left: 190, top: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
