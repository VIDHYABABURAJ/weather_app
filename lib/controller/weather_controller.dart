

import 'package:weather_app/model/current_weather_data.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/repository/weather_repository.dart';

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


}