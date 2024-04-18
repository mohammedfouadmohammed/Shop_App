import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_app/layout/shop_app/shop_layout.dart';
import 'package:first_app/modules/shop_app/login/cubit/cubit.dart';
import 'package:first_app/modules/shop_app/login/cubit/states.dart';
import 'package:first_app/shared/Network/local/cache_helper.dart';
import 'package:first_app/shared/componets/componets.dart';
import 'package:first_app/shared/componets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../register/shop_register_screen.dart';

class ShopLoginScreen extends StatelessWidget
{
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {

    var emailControl = TextEditingController();
    var passwordControl = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        listener: (BuildContext context, state)
        {
          if (state is ShopLoginSuccessState)
          {
            if(state.loginModel.status!)
            {
              print(state.loginModel.message);
              print(state.loginModel.data?.token);
              CacheHelper.saveData(
                  key: 'token',
                  value: state.loginModel.data?.token,)
                  .then((value)
              {
                token = state.loginModel.data?.token;
                navigateAndFinish(context, ShopLayout());
              });
              showToast(
                  text: state.loginModel.message!,
                  state: ToastStates.SUCCESS,
              );
            }else
              {
                print(state.loginModel.message);
                showToast(
                    text: state.loginModel.message!,
                    state: ToastStates.ERROR,
                );
              }
          }
        },
        builder: (BuildContext context, Object? state)
        {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          'Login now to browse our hot offers ',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: emailControl,
                          type: TextInputType.emailAddress,
                          validate: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return'please enter your email address';
                            }
                          },
                          label: "email address",
                          prefix: Icons.email,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: passwordControl,
                          type: TextInputType.visiblePassword,
                          suffix: ShopLoginCubit.get(context).suffix,
                          onSubmit: (value)
                          {
                            if (formKey.currentState!.validate())
                            {
                              ShopLoginCubit.get(context).userLOGIN(
                                email: emailControl.text,
                                password: passwordControl.text,
                              );
                            }
                          },
                          isPassword: ShopLoginCubit.get(context).isPassword,
                          suffixPressed: ()
                          {
                            ShopLoginCubit.get(context).changePasswordVisibility();
                          },
                          validate: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return'password is too short';
                            }
                          },
                          label: "password",
                          prefix: Icons.lock,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingState,
                          builder: (BuildContext context) =>defaultButton(
                            function: () {
                              if (formKey.currentState!.validate())
                              {
                                ShopLoginCubit.get(context).userLOGIN(
                                  email: emailControl.text,
                                  password: passwordControl.text,
                                );
                              }
                            },
                            text: "login",
                            isUpperCase: true,
                          ),
                          fallback: (BuildContext context) => Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'Don\'t have an account?'
                            ),
                            TextButton(
                              onPressed: ()
                              {
                                navigateTo(context, ShopRegisterScreen());
                              },
                              child: Text('REGISTER'),
                            ),
                            // defaultButton(
                            //     function: ()
                            //     {
                            //       navigateTo(context, RegisterScreen());
                            //     },
                            //     text: 'LOGIN'
                            // ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
