import 'package:first_app/modules/shop_app/search/cubit/cubit.dart';
import 'package:first_app/modules/shop_app/search/cubit/states.dart';
import 'package:first_app/shared/componets/componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();

    return BlocProvider(
        create: (BuildContext context) => SearchCubit(),
        child: BlocConsumer<SearchCubit,SearchStates>(
          listener: (BuildContext context, state) {  },
          builder: (BuildContext context, Object? state)
          {
            return Scaffold(
              appBar: AppBar(),
              body: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children:
                    [
                      defaultFormField(
                          controller: searchController,
                          type: TextInputType.text,
                          validate: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'enter text to search';
                            }
                          },
                          onSubmit:(String text)
                          {
                            SearchCubit.get(context).search(text);
                          } ,
                          label: 'Search',
                          prefix: Icons.search,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      if(state is SearchLoadingState) const LinearProgressIndicator(),
                      if(state is SearchSuccessState) Expanded(
                        child: ListView.separated(
                          itemBuilder: (context,index) => buildListProduct(SearchCubit.get(context).model!.data!.data![index] , context, oldPrice: false),
                          separatorBuilder: (context,index) => myDivider(),
                          itemCount: SearchCubit.get(context).model!.data!.data!.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
    );
  }
}