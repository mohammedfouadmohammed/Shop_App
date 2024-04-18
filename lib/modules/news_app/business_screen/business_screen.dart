import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_app/layout/news_app/cubit/cubit.dart';
import 'package:first_app/layout/news_app/cubit/states.dart';
import 'package:first_app/shared/componets/componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var list = NewsCubit.get(context).business;
      return articleBuilder(list,context);
  },
    );
  }
}