import 'package:first_app/layout/shop_app/cubit/cubit.dart';
import 'package:first_app/layout/shop_app/cubit/states.dart';
import 'package:first_app/modules/shop_app/search/search_screen.dart';
import 'package:first_app/shared/componets/componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (BuildContext context, ShopStates state) {  },
      builder: (BuildContext context, ShopStates state)
      {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
                'Salla',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    navigateTo(context, SearchScreen());
                    },
                  icon: Icon(
                      Icons.search,
                  ),
              ),
            ],
          ),
          body: cubit.bottomScreen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index)
            {
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon:Icon(
                    Icons.home,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon:Icon(
                    Icons.apps,
                  ),
                  label: " Categories",
                ),
                BottomNavigationBarItem(
                  icon:Icon(
                    Icons.favorite,
                  ),
                  label: "Favorites",
                ),
                BottomNavigationBarItem(
                  icon:Icon(
                    Icons.settings,
                  ),
                  label: "Settings",
                ),
              ],
          ),

        );
      },
    );
  }
}
