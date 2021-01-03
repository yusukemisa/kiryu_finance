import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'kiryu_finance.dart';

class ShinogiWedget extends StatefulWidget {
  @override
  _ShinogiWedgetState createState() => _ShinogiWedgetState();
}

class _ShinogiWedgetState extends State<KiryuFinanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        const ListTile(
          title: Text('シノギ'),
        ),
        ListBody(context),
      ]),
    );
  }

  Map data;
  List shinogiList;
  var url = 'https://kiryu-finance-dot-kiryu-coco-dev.an.r.appspot.com/';

  // 一回だけ呼びたい
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
  }

  Future getData() async {
    http.Response response = await http.get(url + 'shinogi');
    data = json.decode(response.body); //json->Mapオブジェクトに格納
    print('getData');
    print(response.body);
    setState(() {
      shinogiList = data["shinogi_list"]; //Map->Listに必要な情報だけ格納
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
            leading: Image.network(shinogiList[index]["image_url"].toString()),
            //leading: Image.memory(shinogiList[index]["image_url"].toString().codeUnits),
            title: Text(shinogiList[index]["name"]),
            subtitle: Text('報酬：￥' + shinogiList[index]["reward"].toString()),
            trailing: Icon(Icons.more_vert),
            onTap: () {},
          ),
        );
      },
    );
  }
}
