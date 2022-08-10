import 'package:flutter/material.dart';
import 'package:sistoma_investimentos/menu_dashboard_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcomeee to Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        home: MenuDashboardPage()
    );
  }
}
