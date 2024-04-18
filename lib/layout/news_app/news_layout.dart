import 'package:first_app/layout/news_app/cubit/cubit.dart';
import 'package:first_app/layout/news_app/cubit/states.dart';
import 'package:first_app/shared/Network/remote/dio_helper.dart';
import 'package:first_app/shared/componets/componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/news_app/search_screen/search_screen.dart';
import '../todo_app/cubit/cubit.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsState>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "News App",
            ),
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    navigateTo(context, SearchScreen(),);
                  },
                  icon: Icon(
                      Icons.search
                  ),
              ),
              IconButton(
                onPressed: ()
                {
                  AppsCubit.get(context).changeAppMode();
                },
                icon: Icon(
                    Icons.brightness_6,
                ),
              ),

            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNavBar(index);
            },
            items:  cubit.bottomItem,
          ),
        );
      },
    );
  }
}
