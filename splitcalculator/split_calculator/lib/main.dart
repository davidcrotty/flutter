import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:provider/provider.dart';

import 'CalculatorBloc.dart';
import 'CalculatorForm.dart';
import 'animations.dart';

// inspiration: https://dribbble.com/shots/6792553-Split-Calculator/attachments/1450047
void main() {
//  debugPaintSizeEnabled=true;
  timeDilation = 5;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black, // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
        child: Container(color: Colors.black, child: CalculatorArea()),
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
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 50.0),
                              ),
                              Text(
                                "Per person",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 16.0),
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
                  child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return Stack(
                      children: <Widget>[
                        Hero(
                          tag: "table",
                          flightShuttleBuilder: (BuildContext flightContext,
                              Animation<double> animation,
                              HeroFlightDirection flightDirection,
                              BuildContext fromHeroContext,
                              BuildContext toHeroContext) {
                            return Container(
                              height: constraints.maxHeight,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)),
                            );
                          },
                          child: ChangeNotifierProvider<CalculatorBloc>(
                            builder: (BuildContext context) {
                              return CalculatorBloc();
                            },
                            child: CalculationTable(
                              cellHeight: constraints.maxHeight / 3,
                            ),
                          ),
                        ),
                        Positioned(
                            top: (((constraints.maxHeight / 3) / 2) - 12),
                            // mid point of a cell, minus divider
                            right: 16,
                            child: Hero(
                              tag: "text",
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text("220,45",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple,
                                        backgroundColor: Colors.white)),
                              ),
                            ))
                      ],
                    );
                  }),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}

class CalculationTable extends StatelessWidget {
  final num cellHeight;
  final dividerHeight = 0.5;

  const CalculationTable({Key key, @required this.cellHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorBloc>(builder: (context, bloc, _) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Material(
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder<CalculatorForm>(
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                    return CalculatorForm();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: cellHeight - dividerHeight,
                        child: Center(
                            child: Text("Value",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ],
                  ),
                ),
              ),
              color: Colors.transparent,
            ),
            Container(color: Colors.grey, height: dividerHeight),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: new People(
                  cellHeight: cellHeight, dividerHeight: dividerHeight),
            ),
            Container(color: Colors.grey, height: dividerHeight),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: cellHeight - dividerHeight,
                    child: Center(
                      child: Text(
                        "10% tip",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: cellHeight - dividerHeight,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Material(
                            color: Colors.transparent,
                            child: ButtonTheme(
                              minWidth: 0,
                              child: FlatButton(
                                child: Icon(Icons.add,
                                    size: 36, color: Colors.purple),
                                shape: CircleBorder(),
                                onPressed: () {
                                  print("tapped");
                                },
                                padding: EdgeInsets.all(16),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: ButtonTheme(
                              minWidth: 0,
                              child: FlatButton(
                                child: Icon(Icons.remove, size: 36),
                                shape: CircleBorder(),
                                onPressed: null,
                                padding: EdgeInsets.all(16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

class People extends StatelessWidget {
  const People({
    Key key,
    @required this.cellHeight,
    @required this.dividerHeight,
  }) : super(key: key);

  final num cellHeight;
  final double dividerHeight;

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CalculatorBloc>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: cellHeight - dividerHeight,
          child: Center(
            child: Text(
              "${counter.people} people",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          height: cellHeight - dividerHeight,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: ButtonTheme(
                    minWidth: 0,
                    child: FlatButton(
                      child: Icon(Icons.add, size: 36, color: counter.plusEnabled ? Colors.purple : Colors.grey),
                      shape: CircleBorder(),
                      onPressed: counter.plusEnabled
                          ? () {
                              counter.incrementPeople();
                            }
                          : null,
                      padding: EdgeInsets.all(16),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: ButtonTheme(
                    minWidth: 0,
                    child: FlatButton(
                      child: Icon(Icons.remove, size: 36, color: counter.minusEnabled ? Colors.purple : Colors.grey),
                      shape: CircleBorder(),
                      onPressed: counter.minusEnabled
                          ? () {
                              counter.decrementPeople();
                            }
                          : null,
                      padding: EdgeInsets.all(16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Calculator extends StatelessWidget {
  const Calculator({
    Key key,
  }) : super(key: key);

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
