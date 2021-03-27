import 'package:calculator_app/pages/calculator_page.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: new AfterSplash(),
        title: new Text(
          'Welcome to Calculator',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: Colors.green.shade200),
        ),
        image: Image.network(
            'https://icons.iconarchive.com/icons/inipagi/business-economic/1024/calculator-icon.png'),
        backgroundColor: Colors.black,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 200.0,
        onClick: () => print("Teste"),
        loaderColor: Colors.green.shade200);
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new MaterialApp(
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.deepPurple,
        ),
        home: CalculatorPage(),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         primarySwatch: Colors.deepPurple,
//       ),
//       home: CalculatorPage(),
//     );
//   }
// }
