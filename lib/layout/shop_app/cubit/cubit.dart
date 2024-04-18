 import 'dart:ffi';

import 'package:first_app/layout/shop_app/cubit/states.dart';
import 'package:first_app/models/shop_app/categories_model.dart';
import 'package:first_app/models/shop_app/favourite_change_model.dart';
import 'package:first_app/models/shop_app/home_model.dart';
import 'package:first_app/shared/Network/end_point.dart';
import 'package:first_app/shared/Network/remote/dio_helper.dart';
import 'package:first_app/shared/componets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/shop_app/favorites_model.dart';
import '../../../models/shop_app/login_model.dart';
import '../../../modules/shop_app/cateogries/categories_screen.dart';
import '../../../modules/shop_app/favorites/favorites_screen.dart';
import '../../../modules/shop_app/products/products_screen.dart';
import '../../../modules/shop_app/settings/settings_screen.dart';

class ShopCubit extends Cubit<ShopStates>
 {
   ShopCubit(): super(ShopInitialState());

   static ShopCubit get(context) => BlocProvider.of(context);

   int currentIndex = 0;

   List<Widget> bottomScreen = [
      const ProductsScreen(),
      const CategoriesScreen(),
      const FavoritesScreen(),
      SettingsScreen(),
   ];

   void changeBottom(int index)
   {
     currentIndex = index;
     emit(ShopChangeBottomNavState());
   }

   HomeModel? homeModel;

   Map<int?, bool?> favourite = {};

   void getHomeData()
   {
     emit(ShopLoadingHomeDataState());

     DioHelper.getData(
       url: HOME,
       token: token,
   ).then((value)
   {
     homeModel = HomeModel.fromjson(value?.data);


     //printFullText(homeModel!.data!.banners[0].image!);
     //print(homeModel?.status);

     homeModel?.data?.products.forEach((element)
     {
       favourite.addAll({
         element.id: element.inFavorites,
       });
     });

     print(favourite.toString());

     emit(ShopSuccessHomeDataState());
   }).catchError(
   (error)
   {
     print(error.toString());
     emit(ShopErrorHomeDataState());
   });
 }

   CategoriesModel? categoriesModel;

   void getcategories()
   {
     DioHelper.getData(
       url: GET_CATEGORIES,
       token: token,
     ).then((value)
     {
       categoriesModel = CategoriesModel.fromjson(value?.data);
       emit(ShopSuccessCategoriesState());
     }).catchError(
             (error)
         {
           print(error.toString());
           emit(ShopErrorCategoriesState());
         });
   }


   ChangeFavoritesModel? changeFavoritesModel;

   Future<Void?> changeFavorites (int? productId)
   async {

     favourite[productId] = !favourite[productId]!;
     emit(ShopChangeFavoritesState());

     DioHelper.postData(
         url: FAVORITES,
         data: {
           'product_id': productId,
         },
       token: token,
     ).then((value)
     {
       changeFavoritesModel = ChangeFavoritesModel.fromjson(value!.data);
       print(token);
       print(value.data);
       if(!changeFavoritesModel!.status!) {
         favourite[productId] = !favourite[productId]!;
       }else {
         getFavorites();
       }

       emit(ShopSuccessChangeFavoritesState(changeFavoritesModel!));
     }).catchError((error)
     {
       favourite[productId] = !favourite[productId]!;
       emit(ShopErrorChangeFavoritesState());
     });
     return null;
   }

   FavoritesModel? favoritesModel;

   void getFavorites()
   {

     emit(ShopLoadingGetFavoritesState());


     DioHelper.getData(
       url: FAVORITES,
       token: token,
     ).then((value)
     {
       favoritesModel = FavoritesModel.fromJson(value?.data);
       printFullText(value!.data.toString());
       emit(ShopSuccessGetFavoritesState());
     }).catchError(
             (error)
         {
           print(error.toString());
           emit(ShopErrorGetFavoritesState());
         });
   }

   ShopLoginModel? userModel;

   void getUserData()
   {
     emit(ShopLoadingUserDataState());

     DioHelper.getData(
       url: PROFILE,
       token: token,
     ).then((value)
     {
       userModel = ShopLoginModel.fromJson(value?.data);
       printFullText(userModel!.data!.name!);
       emit(ShopSuccessUserDataState(userModel));
     }).catchError(
             (error)
         {
           print(error.toString());
           emit(ShopErrorUserDataState());
         });
   }

   void updateUserData({
     required String name,
     required String email,
     required String phone,
 })
   {
     emit(ShopLoadingUpdateUserDataState());

     DioHelper.putData(
       url: UPDATE_PROFILE,
       token: token,
       data:
       {
         'name':name,
         'email':email,
         'phone':phone,
       },
     ).then((value)
     {
       userModel = ShopLoginModel.fromJson(value?.data);
       printFullText(userModel!.data!.name!);
       emit(ShopSuccessUpdateUserDataState(userModel));
     }).catchError(
             (error)
         {
           print(error.toString());
           emit(ShopErrorUpdateUserDataState());
         });
   }
 }