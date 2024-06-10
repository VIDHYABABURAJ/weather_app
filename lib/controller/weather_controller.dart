
import 'dart:async';

import 'package:weather_app/model/current_weather_data.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/repository/weather_repository.dart';

import '../model/hourley_forcasting_model.dart';

class WeatherController {
  final weatherrepo = weatherRepo();

  Future<CurrentWeatherModel> getData({required String latitude, required String longitude }) async{
    try{
      final weathermodel = await weatherrepo.getWeatherdata(lat: latitude,lon: longitude);
      print(weathermodel.clouds);
      return weathermodel;
    } catch(e){
      print(e);
      rethrow;
    }
  }

  Future<List<HourlyForecastModel>> getHourlydata({required String latitude, required String longitude}) async{
    try{
      final forcastmodel = await weatherrepo.getForecastdata(lat: latitude, lon: longitude);
     // print(forcastmodel.clouds);
      return forcastmodel;
    }catch(e){
      print(e);
      rethrow;
    }

  }


}