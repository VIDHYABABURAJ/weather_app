import 'package:flutter/material.dart';
import 'package:weather_app/widgets/colum_container.dart';

class WeatherDays extends StatefulWidget {
  const WeatherDays({super.key});

  @override
  State<WeatherDays> createState() => _WeatherDaysState();
}

class _WeatherDaysState extends State<WeatherDays> {
  @override
  Widget build(BuildContext context) {
    return Container(
              height: 150,
              width: 80,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: AlignmentDirectional.bottomEnd,
                  colors: [
                    Color.fromRGBO(70, 50, 150, 1),

                    Color.fromRGBO(142, 110, 210, 1),


                  ]),
            borderRadius: BorderRadius.circular(30)
          ),
          child:WeatherContainer(day: 'Mon',imgs: 'asset/images/Weather _))10 18.png',tem: '19°C',)


        );
  }
}
