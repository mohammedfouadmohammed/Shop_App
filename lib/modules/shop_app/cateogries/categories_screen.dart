import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_app/layout/shop_app/cubit/cubit.dart';
import 'package:first_app/layout/shop_app/cubit/states.dart';
import 'package:first_app/models/shop_app/categories_model.dart';
import 'package:first_app/shared/componets/componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (BuildContext context, ShopStates state) {  },
      builder: (BuildContext context, ShopStates state)
      {
        return  ConditionalBuilder(
          condition: ShopCubit.get(context).categoriesModel != null,
          builder: (context) => ListView.separated(
              itemBuilder: (context,index) => categoriesBuilder(ShopCubit.get(context).categoriesModel!.data!.data[index]),
              separatorBuilder: (context,index) => myDivider(),
              itemCount: ShopCubit.get(context).categoriesModel!.data!.data.length,
          ),
          fallback:(context) => const Center(child: CircularProgressIndicator()),
        );
      },

    );
  }
  Widget categoriesBuilder(DataModel model) =>  Padding(
    padding: EdgeInsets.all(20.0),
    child: Row
      (
      children:
      [
        Image(
          image: NetworkImage(
            model.image!,
          ),
          width: 120.0,
          height: 120.0,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 20.0,
        ),
        Text(
            model.name!,
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Icon(
          Icons.arrow_forward,
        ),
      ],
    ),
  );
}