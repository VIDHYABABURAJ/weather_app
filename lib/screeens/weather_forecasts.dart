import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/screeens/weather_condition.dart';

class WeatherForecaste extends StatefulWidget {
  const WeatherForecaste({super.key});

  @override
  State<WeatherForecaste> createState() => _WeatherForecasteState();
}

class _WeatherForecasteState extends State<WeatherForecaste> {

  final weathercontroller = WeatherController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.bottomEnd,
                colors:[Color.fromRGBO(157, 82, 172, 0.7),Color.fromRGBO(62, 45, 143, 1),])
            ),
          ),
          Image(image: AssetImage('asset/images/cloud.png'),),
          Padding(
            padding: const EdgeInsets.only(top: 450,left: 80),
            child: Text("Weather",style: TextStyle(color: Colors.white ,fontSize: 70,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 530,left: 60),
            child: Text("ForeCasts",style: TextStyle(color: Color.fromRGBO(221, 177, 48, 1) ,fontSize:65),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 670,left: 60,right: 60),
            child: ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStatePropertyAll(Size(300,60)),
                backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(221, 177, 48, 1))

              ),
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherCondition(),));

                },
                child: Text("Get Start",style: TextStyle(color: Color.fromRGBO(62, 45, 143, 1),fontSize: 25,fontWeight: FontWeight.bold),)),
          )
        ],
      ),
    );
  }
}