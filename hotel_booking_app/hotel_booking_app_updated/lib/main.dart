import 'package:flutter/material.dart';
import 'home.dart';
import 'login_page.dart'; // Remove this line
import 'package:hotel_booking_app/login_page.dart'; // Remove this line
import 'package:hotel_booking_app/registration_page.dart';
import 'registration_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/login': (BuildContext context) => LoginPage(),
        '/signup': (BuildContext context) => RegistrationPage(),
        '/home': (BuildContext context) => HomePage(),
      },
    );
  }
}
