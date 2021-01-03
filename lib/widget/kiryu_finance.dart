import 'package:flutter/material.dart';
import 'package:kiryu_finance/widget/shinogi.dart';

class KiryuFinanceWidget extends StatefulWidget {
  @override
  _KiryuFinanceWidgetState createState() => _KiryuFinanceWidgetState();
}

class _KiryuFinanceWidgetState extends State<KiryuFinanceWidget> {
  @override
  Widget build(BuildContext context) {
    return new Column(children: [
      Container(
        height: 300.0,
        width: double.infinity,
        child: Card(
          child: Column(children: <Widget>[
            const ListTile(
              title: Text('残高'),
            ),
            ListTile(
              title: Text('￥100,000,000'),
              tileColor: Colors.cyan,
            ),
            const ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('桐生会からお金を借りる'),
              subtitle: Text('桐生会だから実際安心'),
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(height: 20),
                FloatingActionButton.extended(
                  icon: const Icon(Icons.add),
                  label: Text('お金を借りる'),
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                FloatingActionButton.extended(
                  icon: const Icon(Icons.redo_sharp),
                  label: Text('お金を返す'),
                  onPressed: () {},
                ),
              ],
            ),
          ]),
        ),
      ),
      ShinogiWedget(),
    ]);
  }
}
