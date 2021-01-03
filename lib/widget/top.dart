import 'package:flutter/material.dart';

import 'kiryu_finance.dart';

class TopWidget extends StatefulWidget {
  TopWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TopWidgetState createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: DrawerWidget(),
      // Disable opening the drawer with a swipe gesture.
      drawerEnableOpenDragGesture: true,
      body: KiryuFinanceWidget(),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('This is the Drawer'),
            ElevatedButton(
              onPressed: () => (Navigator.of(context).pop()),
              child: const Text('Close Drawer'),
            ),
          ],
        ),
      ),
    );
  }
}
