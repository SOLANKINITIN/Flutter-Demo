import 'package:flutter/material.dart';

import '../main.dart';

class Swipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: new SwipeHome(),
    );
  }
}

class SwipeHome extends StatelessWidget {
  final List<String> items =
      new List<String>.generate(30, (i) => "Items ${i + 1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe to dismiss"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          // child: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
      ),
      body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, int index) {
            return new Dismissible(
              key: new Key(items[index]),
              onDismissed: (direction) {
                items.removeAt(index);
                // ignore: deprecated_member_use
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text("Item  dismissed"),
                ));
              },
              background: new Container(
                color: Colors.cyan,
              ),
              child: new ListTile(
                title: new Text("${items[index]}"),
              ),
            );
          }),
    );
  }
}
