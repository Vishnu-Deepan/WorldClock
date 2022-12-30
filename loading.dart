import 'package:world_clock/services/world_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {

  String time = "Loading";

  Future<void> setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'India',flag: 'india.png',url: '/Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context,'/home', arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDay':instance.isDay,

    });
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitPulse(
            size: 140,
            color: Colors.lightBlueAccent,
          ),
      ),
      );

  }
}
