import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_app/shared/componets/componets.dart';
import 'package:first_app/shared/componets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/todo_app/cubit/cubit.dart';
import '../../../layout/todo_app/cubit/states.dart';



class NewTasksScreen extends StatelessWidget {
  const NewTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppsCubit, AppStates>(
      listener: (BuildContext context, AppStates state)
      {  },
      builder: (BuildContext context, AppStates state)
      {
        var tasks = AppsCubit.get(context).newTasks;
        return tasksBuilder(tasks: tasks,);
        //   ListView.separated(
        //   itemBuilder: (context, index) => buildTaskItem(tasks[index], context),
        //   separatorBuilder: (context, index) => Padding(
        //     padding: const EdgeInsetsDirectional.only(
        //       start: 20.0,
        //     ),
        //     child: Container(
        //       width: double.infinity,
        //       height: 1.0,
        //       color: Colors.grey[300],
        //     ),
        //   ),
        //   itemCount: tasks.length,
        // );
      },
    );
  }
}
