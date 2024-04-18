import 'dart:math';

import 'package:first_app/shared/componets/componets.dart';
import 'package:flutter/material.dart';

import '../bmi_result/bmi_result_scree.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}


class _BmiScreenState extends State<BmiScreen>
{
  bool isMale = true;
  double height = 120.0;
  int age = 30;
  int weight = 80;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          "BMI Calculator",
        ),
        titleTextStyle: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: ()
                      {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage('assets/images/male.png'),
                              height: 80.0,
                              width: 90.0,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0,),
                          color: isMale ? Colors.red[300] : Colors.red ,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: ()
                      {
                          setState(() {
                            isMale = false;
                          });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Image(
                        image: AssetImage('assets/images/female.png'),
                        height: 80.0,
                        width: 90.0,
                      ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0,),
                          color: isMale ? Colors.red : Colors.red[300],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'CM',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: height,
                      max: 220.0,
                      min: 80.0,
                      onChanged: (value)
                      {
                        setState(() {
                          height = value;
                        });
                        print(value.round());
                      },
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0,),
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                           Text(
                             '${weight}',
                              style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                            ),
                           ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: ()
                              {
                                setState(() {
                                  weight--;
                                });
                              },
                                heroTag: 'weight-',
                                mini: true,
                                child: Icon(
                                  Icons.remove,
                                ),
                              ),
                              FloatingActionButton(onPressed: ()
                              {
                                setState(() {
                                  weight++;
                                });
                              },
                                heroTag: 'weight+',
                                mini: true,
                                child: Icon(
                                  Icons.add,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0,),
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${age}',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: ()
                              {
                                  setState(() {
                                    age--;
                                  });
                              },
                                heroTag: 'age-',
                                mini: true,
                                child: Icon(
                                  Icons.remove,
                                ),
                              ),
                              FloatingActionButton(onPressed: ()
                              {
                                setState(() {
                                  age++;
                                });
                              },
                                heroTag: 'age+',
                                mini: true,
                                child: Icon(
                                  Icons.add,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0,),
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.black,
            height: 60.0,
            child: MaterialButton(onPressed: (){
              var result = weight / pow(height / 100, 2);
              print(result.round());
              navigateTo(context, BMIResultScreen(
                isMale: isMale,
                age: age,
                result: result.round(),
              ),
              );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => BMIResultScreen(
              //       isMale: isMale,
              //       age: age,
              //       result: result.round(),
              //     ),
              //   ),
              // );
            },
              child: Text(
                "CALCULATE",
                style: TextStyle(
                  color: Colors.white,
                ),),
            ),
          ),
        ],
      ),
    );
  }
}
// var result = weight / pow(height / 100, 2);
// print(result.round());
