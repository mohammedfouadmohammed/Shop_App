import 'package:first_app/layout/news_app/cubit/states.dart';

import 'package:first_app/shared/Network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../modules/news_app/business_screen/business_screen.dart';
import '../../../modules/news_app/science_screen/science_screen.dart';
import '../../../modules/news_app/sports_screen/sports_screen.dart';

class NewsCubit extends Cubit<NewsState>
{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItem =[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business_center,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index)
  {
    currentIndex = index;
    if(index == 1)
      getSports();
    if(index == 2)
      getScience();

    emit(NewsBottomNavState());
  }


  List<dynamic> business=[];

  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url:"v2/top-headlines",
      query: {
         'country':'us',
         'category':'business',
         'apiKey':'3ed080dc3f5549399e7fd14c6a8ed7ae',
        // 'country':'eg',
        // 'category':'business',
        // 'apikey':'65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      //print(value?.data['articles'][0]['title']);
      business = value?.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports=[];

  void getSports()
  {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
      url:"v2/top-headlines",
      query: {
        'country':'us',
        'category':'sports',
        'apiKey':'3ed080dc3f5549399e7fd14c6a8ed7ae',
        // 'country':'eg',
        // 'apikey':'65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      //print(value?.data['articles'][0]['title']);
      sports = value?.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  List<dynamic> science=[];

  void getScience()
  {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
      url:"v2/top-headlines",
      query: {
        'country':'us',
        'category':'science',
        'apiKey':'3ed080dc3f5549399e7fd14c6a8ed7ae',
        // 'country':'eg',
        // 'apikey':'65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      //print(value?.data['articles'][0]['title']);
      science = value?.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }


  List<dynamic> search=[];

  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
      url:"v2/everything",
      query: {
        'q':'$value',
        'apiKey':'3ed080dc3f5549399e7fd14c6a8ed7ae',
        // 'country':'eg',
        // 'apikey':'65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      //print(value?.data['articles'][0]['title']);
      search = value?.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}