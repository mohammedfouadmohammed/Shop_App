
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'First APP',
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed:onNotifications, //animus fanction بدون اسم وعند استدعائها من الخارج نستدعي الاسم دون القوسين
            icon: Icon(
              Icons.notifications,
            ),
          ),
          IconButton(onPressed:()
          {
            print('search clicked');
          }, //animus fanction بدون اسم وعند استدعائها من الخارج نستدعي الاسم دون القوسين
            icon: Icon(
              Icons.search,
            ),
          ),
          IconButton(onPressed:(){print("hello");}, //animus fanction بدون اسم وعند استدعائها من الخارج نستدعي الاسم دون القوسين
              icon: Text("Hi"),
          ),
        ],
      ),
      body:
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20.0),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                      image: NetworkImage(
                        "https://www.freecodecamp.org/news/content/images/size/w2000/2022/09/jonatan-pie-3l3RwQdHRHg-unsplash.jpg"),
                    height: 200.0,
                    width: 200.0,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.blue.withOpacity(0.5),
                    width: 200.0,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child:
                    Text(
                      "nature",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
      // SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         "first",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "second",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "third",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "fourth",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "first",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "second",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "third",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "fourth",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "first",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "second",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "third",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "fourth",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "first",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "second",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "third",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "fourth",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "first",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "second",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "third",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "fourth",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "first",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "second",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "third",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "fourth",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "first",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "second",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "third",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //       Text(
      //         "fourth",
      //         style: TextStyle(
      //           fontSize: 30.0,
      //         ),
      //       ),
      //     ],
      //   ),
      // )
      // Container(
      //   color: Colors.cyan,
      //   height: double.infinity,
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.center,//default start
      //     mainAxisAlignment: MainAxisAlignment.center,//default center
      //     mainAxisSize: MainAxisSize.max,
      //     children: [
      //       Container(
      //         color: Colors.red,
      //         child: Text(
      //             "first",
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         color: Colors.yellow,
      //         child: Text(
      //           "second",
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         color: Colors.blue,
      //         child: Text(
      //           "third",
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         color: Colors.green,
      //         child: Text(
      //           "fourth",
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // )
        // Container(
        //   color: Colors.white10,
        //   width: double.infinity,// بيكون للاخر
        //   child: Column(
        //     mainAxisSize: MainAxisSize.max,//default max
        //     crossAxisAlignment: CrossAxisAlignment.center,//default start
        //     mainAxisAlignment: MainAxisAlignment.center,//default start
        //     children: [
              //flex default =1 , flex =2+1+1+1=5
          //flex default =1 , flex =2+1+1+1=5
          //             Expanded(
          //               flex: 2,
          //               child: Container(
          //                 color: Colors.black,
          //                 child: Text(
          //                   "First Text",
          //                   style: TextStyle(
          //                     color: Colors.white,
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 25.0,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Expanded(
          //               child: Container(
          //                 color: Colors.yellow,
          //                 child: Text(
          //                   "Second Text",
          //                   style: TextStyle(
          //                     color: Colors.white,
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 25.0,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Expanded(
          //               child: Container(
          //                 color: Colors.red,
          //                 child: Text(
          //                   "Third Text",
          //                   style: TextStyle(
          //                     color: Colors.white,
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 25.0,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Expanded(
          //               child: Container(
          //                 color: Colors.blue,
          //                 child: Text(
          //                   "Fourth Text",
          //                   style: TextStyle(
          //                     color: Colors.white,
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 25.0,
          //                   ),
          //                 ),
          //               ),
          //             ),
    //
    //           Container(
    //             color: Colors.black,
    //             child: Text(
    //                 "First Text",
    //               style: TextStyle(
    //                 color: Colors.white,
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 25.0,
    //               ),
    //             ),
    //           ),
    //           Container(
    //             color: Colors.yellow,
    //             child: Text(
    //                 "Second Text",
    //               style: TextStyle(
    //                   color: Colors.white,
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 25.0,
    //               ),
    //             ),
    //           ),
    //           Container(
    //             color: Colors.red,
    //             child: Text(
    //               "Third Text",
    //               style: TextStyle(
    //                   color: Colors.white,
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 25.0,
    //               ),
    //             ),
    //           ),
    //           Container(
    //           color: Colors.blue,
    //             child: Text(
    //               "Fourth Text",
    //               style: TextStyle(
    //                   color: Colors.white,
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 25.0,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   //SafeArea(child: Text("hello world"),),//تستخدم في حالة عدم وجود appbar
     );
  }
 void onNotifications() {
  print('notifications clicked');
}
}