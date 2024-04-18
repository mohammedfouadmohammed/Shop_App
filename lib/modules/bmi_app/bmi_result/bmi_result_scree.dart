import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {

  int? result;
 late bool isMale;
  int? age;

  BMIResultScreen({
   required this.result,
    required this.isMale,
    required this.age,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios_sharp
        ),
      ),
    centerTitle: true,
    backgroundColor: Colors.red,
    title: Text(
            'BMIResult',
  ),
  titleTextStyle: TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 50.0,
  ),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Gender : ${isMale ? 'Male' : 'Female'}',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Result : $result',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Age : $age',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
    );
  }
}
