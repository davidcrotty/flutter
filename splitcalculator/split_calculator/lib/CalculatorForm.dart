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
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    child: Text("foo"),
                  ),
                  Container(
                    child: Text("foo"),
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
