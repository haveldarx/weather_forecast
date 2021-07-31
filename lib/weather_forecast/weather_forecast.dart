 import "package:flutter/material.dart";
import 'package:weather_forecast/model/weahter_forecast_model.dart';
import 'package:weather_forecast/ui/bottom_view.dart';
import 'package:weather_forecast/ui/mid_view.dart';

import 'network/network.dart';
 class WeatherForecast extends StatefulWidget {
   const WeatherForecast({ Key? key }) : super(key: key);
 
   @override
   _WeatherForecastState createState() => _WeatherForecastState();
 }
 
 class _WeatherForecastState extends State<WeatherForecast> {
   late Future<WeatherForecastModel> forecastObject ; 
   String _cityName = "Bengaluru";
   @override
  void initState() {
    
    super.initState();
    forecastObject = Network().getWeatherForecast(cityName: _cityName);
    // print(forecastObject);
    // forecastObject.then((Weather) => {
    //   print(Weather.city)
    // }); 
  }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       
         body:ListView(
           children: [
             textFiledView(),
             Container(
               child: FutureBuilder<WeatherForecastModel>(
                 future: forecastObject,
                 builder:( BuildContext context , AsyncSnapshot<WeatherForecastModel> snapshot){
                    if (snapshot.hasData){
                      return Column(
                        children:[
                        midView(snapshot),
                        bottomView(snapshot, context)
                        ]
                      );
                    }
                      return Container(
                      child: Center(child:CircularProgressIndicator(),));
                      
                    
                 }), 
             )
           ],
         ),
       );
       
     
   }

  Widget textFiledView() {
      return Container(
      child:TextField(
            decoration: InputDecoration(
              hintText: "Enter City name",
              prefixIcon:Icon(Icons.search),
              border:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding: EdgeInsets.all(8)
            ),
            onSubmitted:(value){
                setState(() {
                  _cityName= value;
                  forecastObject = new Network().getWeatherForecast(cityName: _cityName);
                });
            }
         ) 
         ) ;
  }
 }