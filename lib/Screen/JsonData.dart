import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.teal),
      home: new HomePages(),
    ));

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => new _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  List data;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Load json Data"),
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('load_json/person.json'),
            // ignore: missing_return
            builder: (context, snapshot) {
              //decode json
              var mydata = json.decode(snapshot.data.toString());
              return new ListView.builder(
                // ignore: missing_return
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text("Name: " + mydata[index]['name']),
                        new Text("Age: " + mydata[index]['age']),
                        new Text("Hieght: " + mydata[index]['hieght']),
                        new Text("Hiar_Color: " + mydata[index]['hair_color']),
                        new Text("Gender: " + mydata[index]['gender']),
                      ],
                    ),
                  );
                },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
