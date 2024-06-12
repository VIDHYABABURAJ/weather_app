import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/utils/constance.dart';

import '../model/current_weather_data.dart';
import '../model/daily_weather_model.dart';
import '../model/hourley_forcasting_model.dart';

class weatherRepo {
  Future<CurrentWeatherModel> getWeatherdata(
      {required dynamic lat, required dynamic lon}) async {
    http.Response res = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=8a42daacec6f47deafa41f28c51931ad'));

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);


      CurrentWeatherModel weatherdata = CurrentWeatherModel.fromJson(data);


      return weatherdata;
    } else {
      throw res;
    }
  }

  Future<List<HourlyForecastModel>> getForecastdata({required dynamic lat,required dynamic lon}) async{

    http.Response res = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=8a42daacec6f47deafa41f28c51931ad'));

    if(res.statusCode == 200){
      var data =jsonDecode(res.body);

       List<HourlyForecastModel> forecastdatalist = data['list'].map<HourlyForecastModel>((e)=> HourlyForecastModel.fromJson(e)).toList() ;



      return forecastdatalist;
    }else{
      throw res;
    }
  }

  Future<DailyWeatherModel> getDailydata({required dynamic cityname}) async{
    http.Response res = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=2b6d8785b848444eb9991631241006&q=london&days=7&aqi=no&alerts=no'));
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      print(data);
      print('dailydata');

      DailyWeatherModel dailydata = DailyWeatherModel.fromJson(data);

      print('dailydata');

      return dailydata;
    } else {
      throw res;
    }



  }

}
