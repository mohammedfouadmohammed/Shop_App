import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_app/layout/shop_app/cubit/cubit.dart';
import 'package:first_app/layout/shop_app/cubit/states.dart';
import 'package:first_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/componets/componets.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (BuildContext context, ShopStates state) {  },
      builder: (BuildContext context, ShopStates state)
      {
        return  ConditionalBuilder(
          condition: state is! ShopLoadingGetFavoritesState,
          builder: (context) => ListView.separated(
            itemBuilder: (context,index) => favoritesBuilder(ShopCubit.get(context).favoritesModel!.data!.data![index].product!, context),
            separatorBuilder: (context,index) => myDivider(),
            itemCount: ShopCubit.get(context).favoritesModel!.data!.data!.length,
          ),
          fallback:(context) => const Center(child: CircularProgressIndicator()),
        );
      },

    );
  }
  Widget favoritesBuilder(model, context) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      height: 120.0,
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(model.image!),
                width: 120.0,
                height: 120.0,
              ),
              if(model.discount != 0) Container(
                color: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 5.0,),
                child: const Text(
                  'DISCOUNT',
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14.0,
                    height: 1.3,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      '${model.price}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: defaultColor,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    if(model.discount != 0 )Text(
                      '${model.oldPrice}',
                      style: const TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: ()
                      {
                        ShopCubit.get(context).changeFavorites(model.id);
                      },
                      icon: CircleAvatar(
                        radius: 15.0,
                        backgroundColor: ShopCubit.get(context).favourite[model.id]! ? Colors.red : defaultColor,
                        child: const Icon
                          (
                          Icons.favorite_border,
                          size: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}