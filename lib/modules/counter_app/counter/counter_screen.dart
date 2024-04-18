import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';


//(State less Widget) contain one class provide widget

//(State full Widget) contain two classes
//(first class) provide widget
//(second class) provide state from this widget

class CounterScreen extends StatelessWidget {
// مراحل الاستدعاء
//1 constructor
//2 init state
//3 build


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {
          if(state is CounterMinusStates) print("minus states ${state.counter}");
          if(state is CounterPlusStates) print("plus states ${state.counter}");
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Counter',
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: ()
                  {
                    CounterCubit.get(context).minus();
                  },
                    child: Text(
                      'MINUS',
                      style: TextStyle(
                        backgroundColor: Colors.black,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 20.0,
                      end: 20.0,
                    ),
                    child: Text(
                      '${CounterCubit.get(context).counter}',
                      style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  TextButton(onPressed: ()
                  {
                    CounterCubit.get(context).plus();
                  },
                    child: Text(
                      'PLUS',
                      style: TextStyle(
                        backgroundColor: Colors.black,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}