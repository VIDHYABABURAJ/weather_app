import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/model/current_weather_data.dart';
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
  CurrentWeatherModel ? _climate ;
  bool loading = false;



  Future<void> _getCurrentPosition() async {
    try {
      setState(() {
        loading = true;
      });
      final hasPermission = await handleLocationPermission(context);
      print(hasPermission);
      if (!hasPermission) {

        setState(() {
          loading = false;
        });
        return;
      };

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print('qwerty');

      _currentPosition = position;
       _climate =  await weathercontroller.getData(latitude: position.latitude.toString(), longitude: position.longitude.toString());
       print('climate : $_climate');
      setState(() {
        loading = false;
      });
    } catch (e) {
      print('sdsd');
      print(e);

    }
  }

  String dateFormat(){
    final datestamp = _climate!.dt;
    print("date : $datestamp");
    DateTime date =  DateTime.fromMillisecondsSinceEpoch(datestamp! * 1000);
    print(date);
    String formattedDate = DateFormat('MMM d').format(date);
    print(formattedDate);
    return formattedDate;
  }

  double kelvintoTemp(){
    final kelvin = _climate!.main!.temp;
    final keltoTemp = kelvin! - 273.15;

    return keltoTemp;
  }
  double maxTemp(){
    final max = _climate!.main!.tempMax;
    final max_Temp = max! - 273.15;

    return max_Temp;
  }
  double minTemp(){
    final min = _climate!.main!.tempMin;
    final min_Temp = min! - 273.15;

    return min_Temp;
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
      body: loading ? Center(child: CircularProgressIndicator()):  Container(
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
           //  " oo",
              "${_climate != null ? _climate!.name : '0'}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              //'kkk',
              "${kelvintoTemp().toStringAsFixed(0)}°",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              //'jj',
              "${_climate!.weather![0].description}",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                 // 'oo',
                  "Max: ${maxTemp().toStringAsFixed(0)}°",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                 // 'iii',
                  "Min: ${minTemp().toStringAsFixed(0)}°",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],),
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
                        child: Text(
                            //'pp',
                            "${dateFormat()}",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                      )
                    ],),
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
                    ],)
                ],),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LocationScreen(
                            weather: _climate!.weather![0].description.toString(),
                            min: minTemp().toStringAsFixed(0),
                            max: maxTemp().toStringAsFixed(0),





                          ),
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
              ],)
          ],),
      ),
    );
  }
}
