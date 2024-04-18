import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/todo_app/cubit/cubit.dart';
import '../../../layout/todo_app/cubit/states.dart';
import '../../../shared/componets/componets.dart';



class ArchivedTasksScreen extends StatelessWidget {
  const ArchivedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppsCubit, AppStates>(
      listener: (BuildContext context, AppStates state)
      {  },
      builder: (BuildContext context, AppStates state)
      {
        var tasks = AppsCubit.get(context).archivedTasks;
        return tasksBuilder(tasks: tasks,);
      },
    );
  }
}