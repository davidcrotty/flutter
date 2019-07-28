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
              Column(
                children: <Widget>[
                  Container(
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
                  Expanded(
                    child: Center(child: Text("200, 45")),
                  ),
                  Container(
                    height: 80,
                    child: Center(
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                            color: Colors.purple,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
