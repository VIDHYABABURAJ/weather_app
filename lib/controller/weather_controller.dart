
import 'dart:async';

import 'package:weather_app/model/current_weather_data.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/repository/weather_repository.dart';
import 'package:weather_app/utils/constance.dart';

import '../model/daily_weather_model.dart';
import '../model/hourley_forcasting_model.dart';

class WeatherController {
  final weatherrepo = weatherRepo();

  Future<CurrentWeatherModel> getData({required dynamic latitude, required dynamic longitude }) async{
    try{
      final weathermodel = await weatherrepo.getWeatherdata(lat: latitude,lon: longitude);
      print(weathermodel.clouds);
      return weathermodel;
    } catch(e){
      print(e);
      rethrow;
    }
  }

  Future<List<HourlyForecastModel>> getHourlydata({required dynamic latitude, required dynamic longitude}) async{
    try{
      final forcastmodel = await weatherrepo.getForecastdata(lat: latitude, lon: longitude);
     // print('aaa');
      return forcastmodel;
    }catch(e){
      print(e);
      rethrow;
    }

  }

  Future<DailyWeatherModel> getDaily(
      {required dynamic cityname}) async{

    try{
      final dailyweathre = await weatherrepo.getDailydata(cityname:cityname );
      return dailyweathre;
    }catch(e){
      print(e);
      rethrow;
    }


  }


}