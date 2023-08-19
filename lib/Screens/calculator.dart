import 'package:flutter/material.dart';
import 'package:iphone_calculator/Constraints/constraint.dart';

import '../Components/button.dart';
import 'package:math_expressions/math_expressions.dart';

class MyIphoneCalculator extends StatefulWidget {
  const MyIphoneCalculator({super.key});

  @override
  State<MyIphoneCalculator> createState() => _MyIphoneCalculatorState();
}

class _MyIphoneCalculatorState extends State<MyIphoneCalculator> {
  var input = '';
  var output = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: black,
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        input.toString(),
                        style: TextStyle(
                            fontSize: 30,
                            color: white,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                         output.toString(),
                        style: TextStyle(
                            fontSize: 30,
                            color: white,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Button(
                            color: lightgray,
                            text: "AC",
                            textColor: Colors.black,
                            press: () {
                              input = '';
                              output = '';
                              setState(() {});
                            }),
                        Button(
                            color: lightgray,
                            text: "+/-",
                            textColor: Colors.black,
                            press: () {
                              input += '+/-';
                              setState(() {});
                            }),
                        Button(
                            color: lightgray,
                            text: "%",
                            textColor: Colors.black,
                            press: () {
                              input += '%';
                              setState(() {});
                            }),
                        Button(
                            color: yellow,
                            text: "/",
                            textColor: white,
                            press: () {
                              input += '/';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                            color: darkgray,
                            text: "7",
                            textColor: white,
                            press: () {
                              input += '7';
                              setState(() {});
                            }),
                        Button(
                            color: darkgray,
                            text: "8",
                            textColor: white,
                            press: () {
                              input += '8';
                              setState(() {});
                            }),
                        Button(
                            color: darkgray,
                            text: "9",
                            textColor: white,
                            press: () {
                              input += '9';
                              setState(() {});
                            }),
                        Button(
                            color: yellow,
                            text: "x",
                            textColor: white,
                            press: () {
                              input += 'x';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                            color: darkgray,
                            text: "4",
                            textColor: white,
                            press: () {
                              input += '4';
                              setState(() {});
                            }),
                        Button(
                            color: darkgray,
                            text: "5",
                            textColor: white,
                            press: () {
                              input += '5';
                              setState(() {});
                            }),
                        Button(
                            color: darkgray,
                            text: "6",
                            textColor: white,
                            press: () {
                              input += '6';
                              setState(() {});
                            }),
                        Button(
                            color: yellow,
                            text: "-",
                            textColor: white,
                            press: () {
                              input += '-';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                            color: darkgray,
                            text: "1",
                            textColor: white,
                            press: () {
                              input += '1';
                              setState(() {});
                            }),
                        Button(
                            color: darkgray,
                            text: "2",
                            textColor: white,
                            press: () {
                              input += '2';
                              setState(() {});
                            }),
                        Button(
                            color: darkgray,
                            text: "3",
                            textColor: white,
                            press: () {
                              input += '3';
                              setState(() {});
                            }),
                        Button(
                            color: yellow,
                            text: "+",
                            textColor: white,
                            press: () {
                              input += '+';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                            color: darkgray,
                            text: "0",
                            textColor: white,
                            press: () {
                              input += '0';
                              setState(() {});
                            }),
                        Button(
                            color: darkgray,
                            text: ".",
                            textColor: white,
                            press: () {
                              input += '.';
                              setState(() {});
                            }),
                        Button(
                            color: darkgray,
                            text: "DEL",
                            textColor: white,
                            press: () {
                              input = input.substring(0, input.length - 1);
                              setState(() {});
                            }),
                        Button(
                            color: yellow,
                            text: "=",
                            textColor: white,
                            press: () {
                              result();
                              setState(() {});
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void result() {
    String finalinput = input;
    finalinput = input.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    output = eval.toString();
  }
}
