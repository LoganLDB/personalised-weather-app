//import 'dart:collection';

import 'package:http/http.dart' as http;
//import 'dart:convert';
//import 'dart:io';
import 'package:personalised_weather_app/api/model/current_weather.dart';

class APICalls{
  static String APIToken = "";
  static Future<CurrentWeather> getCurrentWeather() async {
    String url = "https://api.openweathermap.org/data/2.5/weather?lat=52.45&lon=--1.93&appid="+APIToken+"&units=metric";
    try{
      /*final response = await http.get(Uri.parse(url), headers:{
        HttpHeaders.authorizationHeader: APIToken
      },);*/
      final response = await http.get(Uri.parse(url));
      print(response.body);
      print(response.statusCode);
      if (200 == response.statusCode){
        final CurrentWeather c = CurrentWeatherFromJson(response.body);
        return c;
      } else{
        print("ooof");
        return Future.error('FooError');
      }
    } catch (e){
      print(e);
      print("rip");
      return Future.error('FooError');
    }
  }
}