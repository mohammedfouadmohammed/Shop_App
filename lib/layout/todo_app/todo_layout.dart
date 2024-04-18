import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_app/layout/todo_app/cubit/cubit.dart';
import 'package:first_app/layout/todo_app/cubit/states.dart';
import 'package:first_app/shared/componets/componets.dart';
import 'package:first_app/shared/componets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';

//1.create database
//2.create tables
//3.open database
//4.insert to database
//5.get data from database
//6.update in database
//7.delete from database



class HomeLayout extends StatelessWidget
{

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();



  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => AppsCubit()..CreateDatabase(),
      child: BlocConsumer<AppsCubit , AppStates>(
        listener: (BuildContext context,AppStates state)
        {
          if(state is AppInsertDatabaseState) Navigator.pop(context);
        },
        builder: (BuildContext context, AppStates state) {

          AppsCubit cubit = AppsCubit.get(context);

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text(
                cubit.title[cubit.currentIndex],
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            body: //state is! AppGetDatabaseLoadingState ?  cubit.screens[cubit.currentIndex] : Center(child: CircularProgressIndicator()),
            ConditionalBuilder(
              condition: state is! AppGetDatabaseLoadingState,
              builder: (BuildContext context) { return cubit.screens[cubit.currentIndex]; },
              fallback: (BuildContext context) { return Center(child: CircularProgressIndicator()); },),
            floatingActionButton: FloatingActionButton(
              onPressed: ()
              {
                if(cubit.isBottomSheetShow){
                  if(formKey.currentState!.validate()){
                    cubit.insertDatabase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text
                    );
                  }
                }else{
                  scaffoldKey.currentState!.showBottomSheet(
                        (context) => Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(20.0,),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defaultFormField(
                              controller: titleController,
                              type: TextInputType.text,
                              validate: (String? value){
                                if(value!.isEmpty){
                                  return"title must be not empty";
                                }
                                return null;
                              },
                              label: "Task Title",
                              prefix: Icons.title,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            defaultFormField(
                              controller: timeController,
                              type: TextInputType.datetime,
                              onTap: (){
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  print(value!.format(context));
                                  timeController.text = value.format(context).toString();
                                });
                              },
                              validate: (String? value){
                                if(value!.isEmpty){
                                  return"time must be not empty";
                                }
                                return null;
                              },
                              label: "Task Time",
                              prefix: Icons.timer_sharp,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            defaultFormField(
                              controller: dateController,
                              type: TextInputType.datetime,
                              onTap: (){
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2024-03-05'),
                                ).then((value) {
                                  print(DateFormat.yMMMd().format(value!));
                                  dateController.text = DateFormat.yMMMd().format(value).toString();
                                });
                              },
                              validate: (String? value){
                                if(value!.isEmpty){
                                  return"date must be not empty";
                                }
                                return null;
                              },
                              label: "Task Date",
                              prefix: Icons.calendar_today,
                            ),
                          ],
                        ),
                      ),
                    ),
                    elevation: 50.0,
                  ).closed.then((value) {
                    cubit.changeBottomSheetState(
                        isShow: false,
                        icon: Icons.edit
                    );
                  });
                  cubit.changeBottomSheetState(
                      isShow: true,
                      icon: Icons.add
                  );
                }
              },
              backgroundColor: Colors.blue,
              child: Icon(
                color: Colors.white,
                cubit.fabIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeIndex(index);
              },
              items:
              [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: "Tasks",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check,
                  ),
                  label: "Done",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: "Archive",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}