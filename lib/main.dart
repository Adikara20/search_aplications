import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_search_app/pages/main_page.dart';
import 'package:flutter_search_app/pages/users_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyMainPage(),
    );
  }
}
