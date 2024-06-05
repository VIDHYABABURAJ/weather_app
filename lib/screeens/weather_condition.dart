import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screeens/location_screen.dart';

import '../utils/helper.dart';
import '../widgets/colum_container.dart';

class WeatherCondition extends StatefulWidget {
  //String temp;
  WeatherCondition({super.key});

  @override
  State<WeatherCondition> createState() => _WeatherConditionState();
}

class _WeatherConditionState extends State<WeatherCondition> {
  final weathercontroller = WeatherController();
  String? _currentAddress;
  Position? _currentPosition;
  bool loading = false;

  Future<void> _getCurrentPosition() async {
    try {
      setState(() {
        loading = true;
      });
      final hasPermission = await handleLocationPermission(context);
      if (!hasPermission) {
        setState(() {
          loading = false;
        });
        return;
      }
      ;

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      _currentPosition = position;

      setState(() {
        loading = false;
      });
    } catch (e) {}
  }

  @override
  void initState() {
    _getCurrentPosition();
    // TODO: implement initState
    super.initState();
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('asset/images/cloud.png'),
              width: 180,
              height: 180,
            ),
            Text(
              _currentPosition.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Precipitation",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Max: 24°",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Min: 18°",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
            Image(image: AssetImage("asset/images/House.png")),
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(157, 82, 172, 0.7),
                    Color.fromRGBO(62, 45, 143, 1),
                  ])),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 50),
                        child: Text(
                          "Today",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 150),
                        child: Text("July,21",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      ColumnContainer(
                        img: "asset/images/Weather _))10 18.png",
                        temp: "19°C",
                        time: "15.00",
                      ),
                      ColumnContainer(
                        img: "asset/images/Moon cloud mid rain.png",
                        temp: "18°C",
                        time: "16.00",
                      ),
                      ColumnContainer(
                        img: "asset/images/Moon cloud mid rain.png",
                        temp: "18°C",
                        time: "17.00",
                      ),
                      ColumnContainer(
                        img: "asset/images/Moon cloud mid rain.png",
                        temp: "18°C",
                        time: "18.00",
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LocationScreen(),
                        ));
                  },
                  icon: Icon(
                    Icons.location_on_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(right: 100, top: 30),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_circle_outline,
                      size: 30,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(right: 100, top: 30)),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(top: 30),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
