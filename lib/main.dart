import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '桐生ファイナンス',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      navigatorObservers: [],
      home: MyHomePage(title: '桐生ファイナンス'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  // void _openDrawer() {
  //    _scaffoldKey.currentState.openDrawer();
  // }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    //getData();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: drawer(context),
      // Disable opening the drawer with a swipe gesture.
      drawerEnableOpenDragGesture: true,
      body: ColumnBody(context),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
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

  Map data;
  List shinogiList;
  var url = 'https://kiryu-finance-dot-kiryu-coco-dev.an.r.appspot.com/';

  Future getData() async {
    http.Response response = await http.get(url + 'shinogi');
    data = json.decode(response.body); //json->Mapオブジェクトに格納
    print('getData');
    setState(() {
      shinogiList = data["shinogiList"]; //Map->Listに必要な情報だけ格納
    });
  }

  Widget ListBody(BuildContext context) {
    return ListView.builder(
      //スクロール可能な可変リストを作る
      shrinkWrap: true,
      itemCount: shinogiList == null ? 0 : shinogiList.length, //受け取る数の定義
      itemBuilder: (BuildContext context, int index) {
        //ここに表示したい内容をindexに応じて
        print(shinogiList.length);
        return Card(
          child: ListTile(
            leading: Image.network('https://placehold.jp/50x50.png'),
            title: Text(shinogiList[index]["name"]),
            subtitle: Text('報酬：￥' + shinogiList[index]["reward"].toString()),
            trailing: Icon(Icons.more_vert),
            onTap: () {},
          ),
        );
      },
    );
  }

  Widget ColumnBody(BuildContext context) {
    return new Column(children: [
      Container(
        height: 300.0,
        width: double.infinity,
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     color: Colors.red,
        //     width: 8.0,
        //   ),
        // ),
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
      Container(
        //height: 400.0,
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     color: Colors.blue,
        //     width: 8.0,
        //   ),
        // ),
        child: Column(children: [
          const ListTile(
            title: Text('シノギ'),
          ),
          ListBody(context),
        ]),
      ),
    ]);
  }
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

  Widget drawer(BuildContext context) {
    return Drawer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('This is the Drawer'),
            ElevatedButton(
              onPressed: _closeDrawer,
              child: const Text('Close Drawer'),
            ),
          ],
        ),
      ),
    );
  }
}

class SampleRequest {
  final String key;
  final int order;

  SampleRequest({this.key, this.order});

  Map<String, dynamic> toJson() => {
        'key': key,
        'order': order,
      };
}
