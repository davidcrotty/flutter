import 'package:flutter/material.dart';
import 'selection.dart';

// inspiration: https://dribbble.com/shots/6792553-Split-Calculator/attachments/1450047
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
        child: Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CalculatorArea(),
            )),
      )),
    );
  }
}

class CalculatorArea extends StatelessWidget {
  const CalculatorArea({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                height: constraints.maxHeight * 0.66,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "110,28",
                            style:
                                TextStyle(color: Colors.white, fontSize: 50.0),
                          ),
                          Text(
                            "Per person",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: constraints.maxHeight * 0.34,
                color: Colors.black,
              )
            ],
          ),
          Positioned(
            width: constraints.maxWidth,
            height: 100,
            right: 0,
            bottom: ((constraints.maxHeight * 0.34) + 40),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      "220,50",
                      style: TextStyle(color: Colors.grey, fontSize: 20.0),
                    ),
                  ),
                  Text(
                    "Total",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 0,
            width: constraints.maxWidth,
            height: constraints.maxHeight * 0.34,
            child: Container(
              child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: constraints.maxHeight / 3,
                      child: Text("Value"),
                    ),
                    Container(
                      height: constraints.maxHeight / 3,
                      child: Text("Value"),
                    )
                  ],
                );
              }),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
            ),
          )
        ],
      );
    });
  }
}

class Calculator extends StatelessWidget {
  const Calculator({
    Key key,
  }) : super(key: key);

  // Stack
  // layer 1 use widget builder, / screen by 3.
  // specifies columns.
  // layer 2. Merely positions

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox.fromSize(
                    size: Size.fromHeight(
                        MediaQuery.of(context).size.height * 0.2)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "110,28",
                      style: TextStyle(color: Colors.white, fontSize: 50.0),
                    ),
                    Text(
                      "Per person",
                      style: TextStyle(color: Colors.grey, fontSize: 16.0),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        "220,50",
                        style: TextStyle(color: Colors.grey, fontSize: 20.0),
                      ),
                    ),
                    Text(
                      "Total",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ],
                ),
                Flexible(
                  child: Container(
                    height: 200,
                    color: Colors.orange,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
