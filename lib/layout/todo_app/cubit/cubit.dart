import 'package:first_app/layout/todo_app/cubit/states.dart';
import 'package:first_app/shared/Network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../../modules/todo_app/archived_tasks_screen/archived_tasks_screen.dart';
import '../../../modules/todo_app/done_tasks_screen/done_tasks_screen.dart';
import '../../../modules/todo_app/new_tasks_screen/new_tasks_screen.dart';





class AppsCubit extends Cubit<AppStates>{

  AppsCubit() : super (AppInitialState());

  static AppsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> title = [
    "New Tasks",
    "Done Tasks",
    "Archived Tasks",
  ];

  void changeIndex (int index)
  {
    currentIndex = index;
    emit( AppChangeBottomNavBarState());
  }

  Database? database;
  List<Map> newTasks =[];
  List<Map> doneTasks =[];
  List<Map> archivedTasks =[];

  void CreateDatabase()  {
     openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database.execute("CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)").then((value) {
          print('table created');
        }).catchError((error){
          print('error when creating table ${error.toString()}');
        });
      },

      onOpen: (database){
        getDataFromDatabase(database);
        print('database opened');
      },
    ).then((value)
     {
       database = value;
       emit(AppCreateDatabaseState());
     });
  }

  Future insertDatabase({
    required String? title,
    required String? time,
    required String? date,
  }) async
  {
   await database!.transaction((txn) {
      txn.rawInsert
        (
          'INSERT INTO tasks(title, date, time ,status) VALUES("$title", "$date", "$time", "new")'
        )
          .then((value)
      {
        print("$value inserted successfully");
        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);
      }
      ).catchError((error)
      {
        print('error when inserting new record ${error.toString()}');
      });
      return Future.value();
    });
  }


  void getDataFromDatabase(database)
  {
    newTasks=[];
    doneTasks=[];
    archivedTasks=[];

    emit(AppGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value) {

      value.forEach((element) {
        if(element['status']=='new')
          newTasks.add(element);
        else if(element['status']=='done')
          doneTasks.add(element);
        else archivedTasks.add(element);
      });
      
      emit(AppGetDatabaseState());
    });
  }

  void updateData({
    required String status,
    required int id,
})
  {
    database?.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]
    ).then((value)
    {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    } );
  }


  void deleteData({
    required int id,
  })
  {
    database?.rawDelete(
        'DELETE FROM tasks WHERE id = ?',
        [id]).then((value)
    {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    } );
  }


  bool isBottomSheetShow = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
})
  {
    isBottomSheetShow = isShow;
    fabIcon = icon;

    emit(AppChangeBottomSheetState());
  }


  bool isDark = false;

  void changeAppMode({bool? fromShared})
  {
    if(fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }
}