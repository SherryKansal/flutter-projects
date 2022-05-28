import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const kApiKey = 'f5ed309017accc5032c62adb9952f4ef';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double lat;
  double lon;

  @override
  void initState() {
    super.initState();

    getLocationData();
  }

  void getLocationData() async {
    Location loc = Location();

    await loc.getCurrentLoc();

    lat = loc.latitude;
    lon = loc.longitude;

    Networking net = Networking(
        'https://api.openweathermap.org/data/2.5/waether?lat=$lat&lon=$lon&appid=$kApiKey');

    static var weatherData = await Networking.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
