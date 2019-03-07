import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:decimal/decimal.dart';
import 'package:earthquake_app/tools/data.dart';
import 'dart:convert';

void showonTapMessage(BuildContext context, String message) {
  var alert = new AlertDialog(
    title: Text("Quake"),
    content: Text(message),
    actions: <Widget>[
      FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
  );
  showDialog(context: context, builder: (context) => alert);
}

Future<List<Earthqueke>> getJson(api) async {
  http.Response response = await http.get(api);
  List data = json.decode(response.body)['features'];
  print(data);

  List<Earthqueke> dataList = [];
  for (var item in data){

    Map properties = item["properties"];

    dataList.add(new Earthqueke(
        DateTime.fromMicrosecondsSinceEpoch(properties["time"]),
        properties["place"],
        Decimal.parse(properties["mag"].toString())));
  }
  print(dataList);
  return dataList;
}
