import 'package:flutter/material.dart';
import 'package:flutternews/bloc/importbloc.dart';
import 'package:flutternews/view/importview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Landing(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data;

  void _hitapi() {
    BeritaBloc blocberita = BeritaBloc();
    blocberita.getBerita();
    blocberita.berita.listen((value) {
      setState(() {
        data = value.status;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: Text(data.toString() ?? 'masih kosong')),
      floatingActionButton: FloatingActionButton(
        onPressed: _hitapi,
        tooltip: 'hit',
        child: Icon(Icons.api),
      ),
    );
  }
}
