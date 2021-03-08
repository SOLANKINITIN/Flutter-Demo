import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: new LifeCycle(),
    ));

class LifeCycle extends StatefulWidget {
  @override
  _LifeCycleState createState() => _LifeCycleState();
}

ThemeData _darkTheme = ThemeData(
  accentColor: Colors.red,
  brightness: Brightness.dark,
  primaryColor: Colors.amber,
);

ThemeData _lightTheme = ThemeData(
    accentColor: Colors.pink,
    brightness: Brightness.light,
    primaryColor: Colors.blue);
bool _light = true;

class _LifeCycleState extends State<LifeCycle> with WidgetsBindingObserver {
  AppLifecycleState _applyLifecycleState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _applyLifecycleState = state;
      print("My App State:$_applyLifecycleState");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: _light ? _lightTheme : _darkTheme,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Life Cycle Method'),
        ),
        body: new OrientationBuilder(
          builder: (context, orientation) {
            return new Center(
              //       child: new Switch(
              //   value: _light,
              //   onChanged: (state) {
              //     setState(() {
              //       _light = state;
              //     });
              //   },

              // ),
              child: new Text(
                _applyLifecycleState.toString(),
                style: new TextStyle(
                    fontSize: 22.0,
                    color: orientation == Orientation.portrait
                        ? Colors.blue
                        : Colors.red),
              ),
            );
          },
        ),
      ),
    );
  }
}
