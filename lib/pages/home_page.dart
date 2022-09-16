
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

import 'package:personalised_weather_app/api/api_calls.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState(){
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{

  Future<Widget?> _getWeather(BuildContext context) async{
    var ww = await APICalls.getCurrentWeather();
    return Column(
      children: [
        Text(ww.name),
        Text("Timezone " + (ww.timezone/3600).toString()),
        Text("current temp " + ww.main.temp.toString() + " Celcius"),
        Text("It is currently" + ww.weather[0].main),

      ],
    );
  }

  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("HomePage temp"),
    );
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _getWeather(context),
          builder: (BuildContext context, text) {
            if( text.connectionState == ConnectionState.done){
              if(text.hasData){
                final data = text.data as Widget;
                return data;
              }

            }
            return Center(
              child: Text("Loading")
            );
          }
      ),
    );
  }
}