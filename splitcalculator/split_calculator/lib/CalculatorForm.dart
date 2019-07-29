import 'package:flutter/material.dart';

class CalculatorForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 80,
                        child: ButtonTheme(
                          height: 36,
                          minWidth: 36,
                          child: FlatButton(
                            shape: CircleBorder(),
                            onPressed: () {
                              print("Pressed");
                            },
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              ButtonTheme(
                                height: 36,
                                minWidth: 36,
                                child: FlatButton(
                                  shape: CircleBorder(),
                                  onPressed: () {
                                    print("Tapped");
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text("220, 45", style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.black)),
                              ),
                            ],
                          ),
                          Align(
                            child: Text("Value",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey)),
                            alignment: Alignment.centerRight,
                          )
                        ],
                      ),
                    )),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.grey, width: 0.5))),
                      height: 80,
                      child: Material(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16)),
                        child: InkWell(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Calculate",
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          onTap: () {
                            print("tapped");
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
