import 'package:flutter/material.dart';
import 'package:earthquake_app/tools/utils.dart';
import 'package:earthquake_app/tools/data.dart';

class Home extends StatefulWidget {
  List<Earthqueke> data;

  Home(this.data);

  @override
  State createState() => new HomeState(data);
}

class HomeState extends State<Home> {
  List<Earthqueke> _data = [];

  HomeState(this._data);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Earthquake"),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: new Center(
        child: new ListView.builder(
            itemCount: _data.length,
            padding: const EdgeInsets.all(14.5),
            itemBuilder: (BuildContext context, int position) =>
                _buildItems(context, position)),
      ),
    );
  }

  Column _buildItems(BuildContext context, int position) {
    if (_data.length > 0) {
      return new Column(
        children: <Widget>[
          new Divider(height: 5.5),
          new ListTile(
            title: Text(
              "${_data[position].dt}",
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.9,
                  color: Colors.orange),
            ),
            subtitle: Text(
              "${_data[position].place}",
              style: new TextStyle(fontStyle: FontStyle.italic),
            ),
            leading: new CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                "${_data[position].power}",
                style: new TextStyle(
                  color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () => showonTapMessage(context, _data[position].powerAndplace()),
          )
        ],
      );
    }
  }
}
