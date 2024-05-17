

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Calculator(),
    debugShowCheckedModeBanner: false,
  ));
}
class Calculator extends StatefulWidget {

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Calculator"),
      backgroundColor: Colors.blue,
      ),
    body: Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: Text(text,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold
                )
              )
            )
          ),
          Row(children: [
            calbutton('7',Colors.blue),
            calbutton('8',Colors.blue),
            calbutton('9',Colors.blue),
            calbutton('+',Colors.grey),
          ],
          ),
          Row(children: [
            calbutton('4',Colors.blue),
            calbutton('5',Colors.blue),
            calbutton('6',Colors.blue),
            calbutton('-',Colors.grey),
          ],
          ),
          Row(children: [
            calbutton('1',Colors.blue),
            calbutton('2',Colors.blue),
            calbutton('3',Colors.blue),
            calbutton('x',Colors.grey),
          ],
          ),
          Row(children: [ 
            calbutton('C',Colors.red),
            calbutton('0',Colors.blue),
            calbutton('=',Colors.grey.shade300),
            calbutton('/',Colors.grey),
          ],
          ),
        ],
      ),
      ),
    );
  }

  Widget calbutton(String value,Color colorValue) {
    return Expanded(
      child: OutlinedButton(
        style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colorValue),
        shape: MaterialStateProperty.all(ContinuousRectangleBorder()),
        padding: MaterialStatePropertyAll(EdgeInsets.all(25.0))),
              onPressed: (){
                btnClicked(value);
                // calculate(first, second, opperator);
              }, 
              child: Text(value,
              style: TextStyle(color: Colors.black,
                fontSize: 35
                ),
              )
            ),
    );
  }

  String result = " ",text = " ";
  int first = 0,second = 0, ans = 0;
  String opperator = " ";

  void btnClicked(String btnText){
    if(btnText == "C"){
      text = " ";
      result = " ";
      first = 0;
      second = 0;
      ans = 0;
    }
    else if(btnText == "+"||btnText == "-"||btnText == "x"||btnText == "/"){
      opperator = btnText;
      first = int.parse(text);
      result = " ";
      print(first);
      print(opperator);
    }
    else if(btnText == "="){
        second = int.parse(text);
        print(second);
        if(opperator == "+"){
          result = (first + second).toString();
        }
        if(opperator == "-"){
          result = (first - second).toString();
        }
        if(opperator == "x"){
          result = (first * second).toString();
        }
        if(opperator == "/"){
          result = (first / second).toString();
        }
      }
    else{
      result = text + btnText;
    }
    setState(() {
      text = result;
    });
  }
  // void calculate(int firstno, int secondno, String opp){
  //   if(opp == "+"){
  //     ans = firstno + secondno;
  //     result = ans.toString();
  //     print(result);
      
  //   }

  // }
}