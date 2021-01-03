import 'package:flutter/material.dart';

import 'widget/app_main.dart';

void main() {
  runApp(AppMain());
}

// Widget Body1(BuildContext context) {
//   return Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Text(
//           'You have pushed the button this many times:',
//         ),
//         Text(
//           '$_counter',
//           style: Theme.of(context).textTheme.headline4,
//         ),
//       ],
//     ),
//   );
// }

// Widget CardBody(BuildContext context) {
//   return Center(
//     child: SizedBox(
//         height: 100.0,
//         width: 300,
//         child: Card(
//           child: Text('card!'),
//         )),
//   );
// }
//        child: Column(children: <Widget>[]),
// Widget ListBody(BuildContext context) {
//   List<Widget> list = <Widget>[
//     new ListTile(
//       title: new Text('Title1',
//           style: new TextStyle(color: Colors.green[600], fontSize: 16.0)),
//       leading: new Icon(
//         Icons.android,
//         color: Colors.green[600],
//       ),
//     ),
//     new ListTile(
//       title: new Text('Title2',
//           style: new TextStyle(color: Colors.green[600], fontSize: 16.0)),
//       leading: new Icon(
//         Icons.android,
//         color: Colors.green[600],
//       ),
//     ),
//   ];
//
//   return new ListView(
//     children: list,
//   );
// }
