import 'package:flutter/material.dart';
import 'package:weather_forecast/model/weahter_forecast_model.dart';
import 'package:weather_forecast/weather_forecast/util/forecast_icon.dart';
import 'package:weather_forecast/weather_forecast/util/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot){
 var forecastList = snapshot.data?.list;
 var city = snapshot.data?.city;
 var country = snapshot.data?.city.country;
 var dateTime = new DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt*1000);
 return  Container(
   child : Column(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
       Text("$city,$country",
       style: TextStyle(fontWeight:FontWeight.bold,
       fontSize: 18,
       color:Colors.black87
       ),),
       Text("${Util.getFormateDate(dateTime)}"),
       SizedBox(height: 10,),
      //  Icon(Icons.wb_sunny,size: 195,)
      //Icon(FontAwesomeIcons.cloud,size: 198,color: Colors.blueAccent,), 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: getWeatherIcon(weatherDescription: forecastList[2].weather[2].main,color: Colors.blueAccent,size: 198),
      ),
       Padding(
         padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text("${forecastList[1].temp.day.toStringAsFixed(0)}",
             style: TextStyle(fontSize: 12),),
             Text("${forecastList[2].weather}"),
             
                     ],
                   )
                 
               ),
               Padding(
               padding: const EdgeInsets.symmetric(vertical:12.0,horizontal: 12.0),
               child: Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("${forecastList[4].speed.toStringAsFixed(1)}km/h"),
                         Icon(FontAwesomeIcons.wind,size: 20,color: Colors.brown,),
                       ]
             ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                       children: [
                         Text("${forecastList[4].rain.toStringAsFixed(1)}%"),
                         Icon(FontAwesomeIcons.solidGrinBeamSweat,size: 20,color: Colors.brown,),
                       ],
                     ),
                   ),
                    Row(children: [
           Padding(padding: EdgeInsets.all(8),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("${forecastList[4].temp.max}"),
               Icon(FontAwesomeIcons.temperatureHigh,size: 20,color: Colors.brown,)
             ],
           ),
           )
         ],)
           ],
         ),
        
       )
     ],

   )
 );

 
}