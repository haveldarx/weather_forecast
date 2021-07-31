import 'package:intl/intl.dart';

class Util {
static String appId = "e15709a01860dd968121b2080ed6c1ac";
static String getFormateDate(DateTime dateTime){
  return new DateFormat("EEE,MMM d, y").format(dateTime);
}}