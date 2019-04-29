import 'package:flutter/material.dart';
import 'dart:async';

import 'package:cl_moxie/cl_moxie.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String error;
  bool testing = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  testCarrier() async {
    CarrierArgs args = CarrierArgs();
    args.idCard = "310222197510200218";
    args.idCardName = "侯宇清";
    args.phone = "13817787299";
    args.moxieKey = "8f94aa3fc675431aa5a90872f391ff46";
    args.userId = "1003";
    String ret = await ClMoxie.carrier(args);
    setState(() {
      error = ret == null ? "succ" : ret;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('魔蝎测试'),
              RaisedButton(
                child: Text("点击开始运营商测试"),
                onPressed: testCarrier,
              ),
              Text("result"),
              Text(error ?? "null"),
            ],
          ),
        ),
      ),
    );
  }
}
