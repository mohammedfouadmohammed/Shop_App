
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_app/layout/shop_app/cubit/cubit.dart';
import 'package:first_app/layout/shop_app/cubit/states.dart';
import 'package:first_app/models/shop_app/categories_model.dart';
import 'package:first_app/models/shop_app/home_model.dart';
import 'package:first_app/shared/componets/componets.dart';
import 'package:first_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (BuildContext context, ShopStates state)
      {
        if(state is ShopSuccessChangeFavoritesState)
        {
          if(!state.model.status!)
          {
            showToast(
                text: state.model.message!,
                state: ToastStates.ERROR
            );
          }
        }
      },
      builder: (BuildContext context, ShopStates state)
      {
       return  ConditionalBuilder(
           condition: ShopCubit.get(context).homeModel != null && ShopCubit.get(context).categoriesModel != null,
           builder: (context) => productBuilder(ShopCubit.get(context).homeModel!,ShopCubit.get(context).categoriesModel! , context),
           fallback:(context) => const Center(child: CircularProgressIndicator()),
       );
        },
    );
  }
  Widget productBuilder(HomeModel model, CategoriesModel categoriesModel, context) =>  SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column
      (
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        CarouselSlider(
          items: model.data?.banners.map((e) => Image(
            image: NetworkImage('${e.image}'),
            width: double.infinity,
            fit: BoxFit.cover,
          ),).toList(),
          options: CarouselOptions(
            height: 250.0,
            initialPage: 0,
            viewportFraction: 1.0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Categories',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildCategoryItem(categoriesModel.data!.data[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 7.0,
                    ),
                    itemCount: categoriesModel.data!.data.length,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'New products',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          color: Colors.grey[300],
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: 1 / 1.72 ,
            children: List.generate(model.data!.products.length,
                    (index) => buildGridProduct(model.data!.products[index], context),
            ),
          ),
        ),
      ],
    ),
  );
  Widget buildCategoryItem(DataModel model) => Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children:
    [
      Image(
        image: NetworkImage(model.image!),
        height: 100.0,
        width: 120.0,
        fit: BoxFit.cover,
      ),
      Container(
        color: Colors.black.withOpacity(0.8,),
        width: 150.0,
        child: Text(
          model.name!,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
  Widget buildGridProduct(ProductModel model, context) =>  Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage(model.image!),
              width: 100.0,
              height: 200.0,
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
        Padding(
          padding: const EdgeInsets.all(12.0),
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
              Row(
                children: [
                  Text(
                    '${model.price.round()}',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: defaultColor,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  if(model.discount != 0 )Text(
                    '${model.oldPrice.round()}',
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
                        backgroundColor: ShopCubit.get(context).favourite[model.id]!? Colors.red : defaultColor,
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
  );
}
