import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_app/layout/shop_app/cubit/cubit.dart';
import 'package:first_app/layout/shop_app/cubit/states.dart';
import 'package:first_app/shared/componets/componets.dart';
import 'package:first_app/shared/componets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {

  var fromKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (BuildContext context, state)
      {
        if(state is ShopSuccessUserDataState)
        {
          nameController.text = state.loginModel!.data!.name!;
          emailController.text = state.loginModel!.data!.email!;
          phoneController.text = state.loginModel!.data!.phone!;
        }
      },
      builder: (BuildContext context, Object? state)
      {
        var model = ShopCubit.get(context).userModel;

        nameController.text = model!.data!.name!;
        emailController.text = model.data!.email!;
        phoneController.text = model.data!.phone!;

        return ConditionalBuilder(
          condition: ShopCubit.get(context).userModel != null,
          builder: (BuildContext context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: fromKey,
                child: Column(
                  children:
                  [
                    if(state is ShopLoadingUpdateUserDataState) LinearProgressIndicator(),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField
                      (controller: nameController,
                      type: TextInputType.name,
                      validate: (String? value)
                      {
                        if(value!.isEmpty) 'name must not be empty';
                        return null;
                      },
                      label: 'Name',
                      prefix: Icons.person,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField
                      (controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (String? value)
                      {
                        if(value!.isEmpty) 'email must not be empty';
                        return null;
                      },
                      label: 'Email Address',
                      prefix: Icons.email,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField
                      (controller: phoneController,
                      type: TextInputType.phone,
                      validate: (String? value)
                      {
                        if(value!.isEmpty) 'phone must not be empty';
                        return null;
                      },
                      label: 'Phone Number',
                      prefix: Icons.phone_android,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultButton(
                      function: ()
                      {
                        if(fromKey.currentState!.validate()) {
                          ShopCubit.get(context).updateUserData(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                          );
                        }
                      },
                      text: 'Update',
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultButton(
                        function: ()
                        {
                          signOut(context);
                        },
                        text: 'Logout',
                    ),
                  ],
                ),
              ),
            ),
          ),
          fallback: (BuildContext context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}