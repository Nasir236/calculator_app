import 'package:calculator_app/components/my_button.dart';
import 'package:calculator_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                          child: Text(userInput.toString(), style: TextStyle(fontSize: 30, color: Colors.white),)),
                      Text(answer.toString(), style: TextStyle(fontSize: 30, color: Colors.white),)
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton2(title: "AC", onPress: () {
                          userInput = '';
                          answer = '';
                          setState(() {

                          });
                        }),
                        MyButton2(title: "+/-", onPress: () {
                          userInput += '+/-';
                          setState(() {

                          });
                        }),
                        MyButton2(title: "%", onPress: () {
                          userInput += '%';
                          setState(() {

                          });
                        }),
                        MyButton2(
                          title: "/",
                          onPress: () {
                            userInput += '/';
                            setState(() {

                            });
                          },
                          color: Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton2(title: "7", onPress: () {
                          userInput += '7';
                          setState(() {

                          });
                        }),
                        MyButton2(title: "8", onPress: () {
                          userInput += '8';
                          setState(() {

                          });
                        }),
                        MyButton2(title: "9", onPress: () {
                          userInput += '9';
                          setState(() {
                          });
                        }),
                        MyButton2(
                          title: "x",
                          onPress: () {
                            userInput += 'x';
                            setState(() {

                            });
                          },
                          color: Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton2(title: "4", onPress: () {
                          userInput += '4';
                          setState(() {

                          });
                        }),
                        MyButton2(title: "5", onPress: () {
                          userInput += '5';
                          setState(() {

                          });
                        }),
                        MyButton2(title: "6", onPress: () {
                          userInput += '6';
                          setState(() {

                          });
                        }),
                        MyButton2(
                          title: "-",
                          onPress: () {
                            userInput += '-';
                            setState(() {

                            });
                          },
                          color: Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton2(title: "1", onPress: () {
                          userInput += '1';
                          setState(() {

                          });
                        }),
                        MyButton2(title: "2", onPress: () {
                          userInput += '2';
                          setState(() {

                          });
                        }),
                        MyButton2(title: "3", onPress: () {
                          userInput += '3';
                          setState(() {

                          });
                        }),
                        MyButton2(
                          title: "+",
                          onPress: () {
                            userInput += '+';
                            setState(() {

                            });
                          },
                          color: Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton2(title: "0", onPress: () {
                          userInput += '0';
                          setState(() {

                          });
                        }),
                        MyButton2(title: ".", onPress: () {
                          userInput += '.';
                          setState(() {

                          });
                        }),
                        MyButton2(title: "Del", onPress: () {
                          userInput = userInput.substring(0, userInput.length - 1);
                          setState(() {

                          });
                        }),
                        MyButton2(
                          title: "=",
                          onPress: () {
                            equalPress();
                            setState(() {

                            });
                          },
                          color: Color(0xffffa00a),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void equalPress (){
    String finalUserinput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserinput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, ContextModel());
    answer = eval.toString();
  }
}
