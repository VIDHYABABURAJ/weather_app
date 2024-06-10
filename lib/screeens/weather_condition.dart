

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/model/current_weather_data.dart';
import 'package:weather_app/model/hourley_forcasting_model.dart';
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
 List<HourlyForecastModel> ? _forecast;
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

      print(position.longitude);

      _currentPosition = position;
       _climate =  await weathercontroller.getData(latitude: position.latitude.toString(), longitude: position.longitude.toString());
       print('climate : $_climate');

       _forecast = await weathercontroller.getHourlydata(latitude: position.latitude.toString(), longitude: position.longitude.toString());
       print('forecast : $_forecast');
      setState(() {
        loading = false;
      });
    } catch (e) {
      print('sdsd');
      print(e);

    }
  }

  String dateFormat({required int wthrdate,required String format}){
    
    
    DateTime date =  DateTime.fromMillisecondsSinceEpoch(wthrdate * 1000);
   
    String formattedDate = DateFormat(format).format(DateTime.now());
   
    return formattedDate;
  }
 


  double kelvintoTemp({required final temp}){
   // final kelvin = _climate!.main!.temp;
    final keltoTemp = temp - 273.15;
    return keltoTemp;
  }

  // double maxTemp(){
  //   final max = _climate!.main!.tempMax;
  //   final max_Temp = max! - 273.15;
  //
  //   return max_Temp;
  // }
  // double minTemp(){
  //   final min = _climate!.main!.tempMin;
  //   final min_Temp = min! - 273.15;
  //
  //   return min_Temp;
  // }
  //
 
  @override
  void initState() {
    _getCurrentPosition();
    // TODO: implement initState
    super.initState();
  }

  List<Widget> getHourlyWidgetlist(){
    

    List<Widget> widgetlist = _forecast!.map((e) =>SizedBox(
      width: 150,
      child: ColumnContainer(
        img:getIcon(weatherIcon: e.weather![0].main!),
        temp: "${kelvintoTemp(temp: e.main!.temp).toStringAsFixed(0)}°C",
        time: "${dateFormat(format: 'h:mm a',wthrdate: e.dt)}",
      ),
    ), ).toList();
    
    return widgetlist;
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
              "${_climate != null ? _climate!.name : '0'}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "${kelvintoTemp(temp:_climate!.main!.temp).toStringAsFixed(0)}°",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "${_climate!.weather![0].description}",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Max: ${kelvintoTemp(temp: _climate!.main!.tempMax).toStringAsFixed(0)}°",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Min: ${kelvintoTemp(temp: _climate!.main!.tempMin).toStringAsFixed(0)}°",
                  style: TextStyle(color: Colors.white, fontSize: 20),
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
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 200),
                        child: Text(
                            "${dateFormat(wthrdate:_climate!.dt!,format: 'MMM d')}",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      )
                    ],),
                  Divider(),
                  SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children:  getHourlyWidgetlist()),
                  )
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
                            min: kelvintoTemp(temp:  _climate!.main!.tempMin).toStringAsFixed(0),
                            max:kelvintoTemp(temp: _climate!.main!.tempMax).toStringAsFixed(0),
                            sunset:_climate!.sys!.sunset,
                            sunrise: _climate!.sys!.sunrise,


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
