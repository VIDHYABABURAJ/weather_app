import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/utils/constance.dart';

import '../model/current_weather_data.dart';
import '../model/hourley_forcasting_model.dart';

class weatherRepo {
  Future<CurrentWeatherModel> getWeatherdata(
      {required String lat, required String lon}) async {
    http.Response res = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=8a42daacec6f47deafa41f28c51931ad'));

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      print(data);

      CurrentWeatherModel weatherdata = CurrentWeatherModel.fromJson(data);

      print('dddddddddddd');

      return weatherdata;
    } else {
      throw res;
    }
  }

  Future<List<HourlyForecastModel>> getForecastdata({required String lat,required String lon}) async{

    http.Response res = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=8a42daacec6f47deafa41f28c51931ad'));

    if(res.statusCode == 200){
      var data =jsonDecode(res.body);
      print('forcast data');
      print(data);

       List<HourlyForecastModel> forecastdatalist = data['list'].map<HourlyForecastModel>((e)=> HourlyForecastModel.fromJson(e)).toList() ;
       print("converted data");
       print(forecastdatalist);


      return forecastdatalist;
    }else{
      throw res;
    }
  }
}
