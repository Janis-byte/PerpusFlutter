import 'package:flutter/material.dart';
import 'package:navigasi_flutter/views/home_view.dart';
import 'package:navigasi_flutter/views/login_view.dart';
import 'package:navigasi_flutter/views/movie_view.dart';
import 'package:navigasi_flutter/views/profile_view.dart';
import 'package:navigasi_flutter/views/transaksi_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeView(),
        '/login': (context) => LoginView(),
        '/transaksi': (context) => TransaksiView(),
        '/profile': (context) => ProfileView(),
        '/movie': (context) => MovieView(),
      },
    );
  }
}
