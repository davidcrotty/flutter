import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("List app", style: TextStyle(color: Colors.black),),
          ),
          body: Center(child: Material(child: ListWidget()))),
    );
  }
}

class ListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      child: ListView(
        children: <Widget>[
          PurpleWidget(),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Album'),
          )
        ],
      ),
    );
  }
}

class PurpleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        highlightColor: Colors.deepPurple,
        splashColor: Colors.deepPurple,
        child: ListTile(
          leading: Icon(Icons.map),
          title: Text('Map'),
        ),
        onTap: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Tap'),
          ));
        },
      ),
      color: Colors.deepOrange,
    );
  }
}
