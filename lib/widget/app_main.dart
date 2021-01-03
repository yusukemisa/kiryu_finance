import 'package:flutter/material.dart';
import 'package:kiryu_finance/widget/top.dart';

class AppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '桐生ファイナンス',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      navigatorObservers: [],
      home: TopWidget(title: '桐生ファイナンス'),
    );
  }
}
