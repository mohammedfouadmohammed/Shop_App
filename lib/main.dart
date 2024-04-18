import 'package:first_app/layout/news_app/cubit/cubit.dart';
import 'package:first_app/layout/shop_app/cubit/cubit.dart';
import 'package:first_app/layout/shop_app/shop_layout.dart';
import 'package:first_app/modules/shop_app/login/shop_login_screen.dart';
import 'package:first_app/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:first_app/shared/Network/local/cache_helper.dart';
import 'package:first_app/shared/Network/remote/dio_helper.dart';
import 'package:first_app/shared/block_observe.dart';
import 'package:first_app/shared/componets/constants.dart';
import 'package:first_app/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/todo_app/cubit/cubit.dart';
import 'layout/todo_app/cubit/states.dart';


void main() async {
     //بيتاكد ان كل حاجة هنا في الميثود خلصت وبعدين يفتح الاب
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
 await CacheHelper.init();

 bool? isDark = CacheHelper.getData(key: 'isDark');

 Widget widget;

 bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
 token = CacheHelper.getData(key: 'token');

 if(onBoarding != null)
 {
   if(token != null) {
     widget = ShopLayout();
   } else {
     widget = ShopLoginScreen();
   }
 }else {
   widget = OnBoardingScreen();
 }

  runApp( Myapp(
    //isDark: isDark!,
    statWidget: widget,
  ));//
}
//  StatelessWidget
 // StatefulWidget
class Myapp extends StatelessWidget//this come  from library 'package:flutter/material.dart' calling from (important)
{
  //final bool isDark;
  final Widget statWidget;
  const Myapp({super.key,
    // required this.isDark,
     required this.statWidget,
  });



  @override
  Widget build(BuildContext context)
  {
  return MultiBlocProvider(
    providers: [
      BlocProvider(create: (context)=>  NewsCubit()..getBusiness()..getSports()..getScience(), ),
      BlocProvider(create: (BuildContext context) => AppsCubit()..changeAppMode()),//fromShared: isDark,),),
      BlocProvider(create: (BuildContext context) => ShopCubit()..getHomeData()..getcategories()..getFavorites()..getUserData()),
    ],
    child: BlocConsumer<AppsCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return MaterialApp(
          debugShowMaterialGrid: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: AppsCubit.get(context).isDark ? ThemeMode.light : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: statWidget,
        );
      },
    ),
  );
  }
}
