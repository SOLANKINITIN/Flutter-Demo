import 'package:flutter/material.dart';

class OldHome extends StatefulWidget {
  @override
  _OldHomeState createState() => _OldHomeState();
}

class _OldHomeState extends State<OldHome> {
  double get height {
    return MediaQuery.of(context).size.height;
  }

  double get width {
    return MediaQuery.of(context).size.width;
  }

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  double top1 = 120;
  double top2 = 330;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: NotificationListener<ScrollUpdateNotification>(
        // ignore: missing_return
        onNotification: (v) {
          if (v is ScrollNotification) {
            setState(() {
              top1 = top1 - v.scrollDelta / 2;
              top2 = top2 - v.scrollDelta / 1;
            });
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: top1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Container(
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(width: 10.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0) //
                        ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 30),
                    child: Text(
                      'Box 1',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: top2,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(width: 10.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0) //
                        ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 70, horizontal: 30),
                    child: Text(
                      'Notice how this goes up futher than the previous box',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            ListView(
              children: [
                Container(
                  height: 1500,
                  color: Colors.transparent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
