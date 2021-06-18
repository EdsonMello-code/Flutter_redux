import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redux/views/home_page_view.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
