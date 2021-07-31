 import 'dart:convert';

import 'package:weather_forecast/model/weahter_forecast_model.dart';
import 'package:weather_forecast/weather_forecast/util/forecast_util.dart';
import 'package:http/http.dart';

class Network {
   Future<WeatherForecastModel> getWeatherForecast({required String cityName}) async {
     var finalurl = "https://api.openweathermap.org/data/2.5/forecast?q="+cityName+"&appid="+Util.appId+"&units=metric";  
     final response =  await get(Uri.parse(finalurl));
     if (response.statusCode == 200){
       return WeatherForecastModel.fromJson(json.decode(response.body));
   }
   else  {
     throw Exception("Error getting weather forecast");
   }
   }
} 