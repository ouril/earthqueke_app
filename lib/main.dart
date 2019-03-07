import 'package:flutter/material.dart';
import 'package:earthquake_app/tools/utils.dart';
import 'package:earthquake_app/ui/home.dart';

final String api =
    "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";


void main() async {

  var data = await getJson(api);
  print(data);
  runApp(
    new MaterialApp(
      home: new Home(data) ,
    )

  );

}


