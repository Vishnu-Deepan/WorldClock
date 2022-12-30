
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  late String location;  //location for the UI
  late String time="";    //time in that location
  late String flag;    //url to asset flag icon
  late String url;    //location url for api endpoint
  late bool isDay;

  WorldTime({required this.flag,required this.location,required this.url});

  Future<void> getTime() async {

    try {
      Response response = await get(
          Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      //print(data);

      String datetime = data['datetime'];
      String offset1 = data['utc_offset'].substring(1,3);
      String offset2 = data['utc_offset'].substring(4,6);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));

      isDay=now.hour>6 && now.hour<19 ? true : false ;

      time = DateFormat.jm().format(now);
    }
    catch(e){
      print(" C A U G H T   E R R O R   $e");
      time="could not get Time Data";
    }
  }

}

