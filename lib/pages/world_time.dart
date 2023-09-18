import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{
  String location;//location name for UI
  late String time;//time in that loc
  String flag;//url to asset
  String url;
  late bool isDaytime;

WorldTime({required this.location,required this.flag,required this.url});


 Future<void> getTime() async {
   
   try{
   var response=await http.get(Uri(
        scheme: 'http',
        host: 'worldtimeapi.org',
        path: 'api/timezone/$url'));
   Map data=jsonDecode(response.body);
   String datetime = data['datetime'];
   String offset = data['utc_offset'].substring(0, 3);
   DateTime now = DateTime.parse(datetime.substring(0,26));
   time=DateFormat.jm().format(now);
   isDaytime= now.hour>6 &&now.hour<20  ? true:false;
   
    //now.toString();//set time property
   }
   catch(e){
    print("Caught error:$e");
    time="Could not get time data";
   }
   //now = now.add(Duration(hours: int.parse(offset)));

    //simulate netw request
  //    String username= await Future.delayed(const Duration(seconds: 3),(){
  //       return "Yoshi";
  //   });
  //   //simulate 2nd req
  //  String bio= await Future.delayed(const Duration(seconds: 2),(){
  //       return "Bio";
  //   });
  //     print("$username-$bio");
  }

}


