import 'package:flutter/material.dart';

import '../../../models/user/user_model.dart';



class UserScreen extends StatelessWidget
{
  List<usermodel> users =[
    usermodel(
      id:5,
      phone: "01149874501",
      name: "midomojhjj",
    ),
    usermodel(
      id:1,
      phone: "0114987455501",
      name: "midomojjdsnj",
    ),
    usermodel(
      id:2,
      phone: "01149875501",
      name: "mid,;flsd,omojhjj",
    ),
    usermodel(
      id:3,
      phone: "0114987466661",
      name: "midkmndfslnmojhjj",
    ),
    usermodel(
      id:6,
      phone: "011498755501",
      name: "midomojj",
    ),
    usermodel(
      id:4,
      phone: "04449874501",
      name: "mimojhjj",
    ),
  ];

  UserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text(
      "Users"
    ),
    ),
    body: ListView.separated(
      itemBuilder: (context, index) => builduseritem(users[index]),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20.0,
          ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.black,
          ),
        ),
        itemCount: users.length,
    ),
   );
  }
  Widget builduseritem(usermodel user) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          child:
          Text(
            '${user.id}',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.name}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${user.phone}',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
