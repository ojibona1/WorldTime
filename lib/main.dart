import 'package:flutter/material.dart';
import 'package:practice/pages/choose_location.dart';
import 'package:practice/pages/home.dart';
import 'package:practice/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation(),
    },
  ));
}
