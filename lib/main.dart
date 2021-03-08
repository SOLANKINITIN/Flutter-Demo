// import 'package:flutter/material.dart';

// import 'home.dart';
// // import 'oldHome.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Home(),
//     );
//   }
// }

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:parllax/Screen/Bottom.dart';
import 'package:parllax/Screen/Home.dart';
import 'package:parllax/Screen/Swipe.dart';
import 'package:parllax/Screen/WhatsApp_Home.dart';
import 'package:parllax/Screen/loginApp.dart';
import 'package:parllax/Screen/music.dart';

import 'Screen/FetchData.dart';
import 'Screen/JsonData.dart';
import 'Screen/Settings.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      // theme: new ThemeData(
      //   primaryColor: new Color(0xff075E54),
      //   accentColor: new Color(0xff25D366),
      // ),
      // debugShowCheckedModeBanner: false,
      home: MyAppPage(title: appTitle),
    );
  }
}

class MyAppPage extends StatelessWidget {
  final String title;

  MyAppPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('My Page!')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Nitin Solanki"),
              accountEmail: new Text("solankinitin2912@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.deepPurple
                        : Colors.white,
                child: new Text("N"),
              ),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.deepPurple
                          : Colors.white,
                  child: new Text("S"),
                )
              ],
            ),
            ListTile(
              leading: new Icon(Icons.home),
              trailing: new Icon(Icons.arrow_forward_ios_rounded),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            ListTile(
              leading: new Icon(Icons.settings),
              trailing: new Icon(Icons.arrow_forward_ios_rounded),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
            ),
            ListTile(
              leading: new Icon(Icons.tab),
              trailing: new Icon(Icons.arrow_forward_ios_rounded),
              title: Text('tab'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabPage()),
                );
              },
            ),
            ListTile(
              leading: new Icon(Icons.whatshot),
              trailing: new Icon(Icons.arrow_forward_ios_rounded),
              title: Text('Whatsapp'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WhatsAppHome(cameras: cameras)),
                );
              },
            ),
            ListTile(
              leading: new Icon(Icons.music_note),
              trailing: new Icon(Icons.arrow_forward_ios_rounded),
              title: Text('Music'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Music()),
                );
              },
            ),
            ListTile(
              leading: new Icon(Icons.login),
              trailing: new Icon(Icons.arrow_forward_ios_rounded),
              title: Text('Login'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginApp()),
                );
              },
            ),
            ListTile(
              leading: new Icon(Icons.swipe),
              trailing: new Icon(Icons.arrow_forward_ios_rounded),
              title: Text('Swipe'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Swipe()),
                );
              },
            ),
            ListTile(
              leading: new Icon(Icons.data_usage),
              trailing: new Icon(Icons.arrow_forward_ios_rounded),
              title: Text('Fetch Json Data '),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePages()),
                );
              },
            ),
            ListTile(
              leading: new Icon(Icons.data_usage),
              trailing: new Icon(Icons.arrow_forward_ios_rounded),
              title: Text('Fetch data api  '),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainFetchData()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
