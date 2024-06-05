import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/utils/constance.dart';

class weatherRepo{

  Future<dynamic> getWeatherdata({required String lat , required String lon }) async{
    http.Response res = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=10.532784778090969&lon=76.22768573455708&appid=8a42daacec6f47deafa41f28c51931ad'));

    if(res == 200){
      var data = jsonDecode(res.body);
      print(data);

      List<WeatherModel> weatherdata = data['List'].map<WeatherModel>((e) => WeatherModel.fromJson(e)).toList();


      return weatherdata;




    }
  }
  
}