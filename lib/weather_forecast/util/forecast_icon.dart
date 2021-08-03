import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
Widget getWeatherIcon({String? weatherDescription, Color? color,double? size}){
  switch(weatherDescription){
    case "clear":
    {return Icon(FontAwesomeIcons.sun,color: color,size: size,);}
    case "clouds":
    {return Icon(FontAwesomeIcons.cloud,color: color,size: size,);}
    case "light rain":
    {return Icon(FontAwesomeIcons.cloudRain,color: color,size: size,);}
    case "snow":
    {return Icon(FontAwesomeIcons.snowman,color: color,size: size,);}
    default: {return Icon(FontAwesomeIcons.sun,color: color,size: size,);}
    

  }
}