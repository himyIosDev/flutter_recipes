import 'package:flutter/material.dart';
import 'package:flutter_recepies/Pages/home_page.dart';
import 'package:flutter_recepies/Pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //
  @override
  Widget build(BuildContext context) {
    //
    return MaterialApp(
      //
      title: 'Recip Book',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        //
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          //
          titleTextStyle: TextStyle(
            //
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // initial page after splash screen
      initialRoute: "/login",
      routes: {
        "/login": (context) => const LoginPage(),
        "/home": (context) => const HomePage(),
      },
      // home: const LoginPage(),
    );
  }
}
