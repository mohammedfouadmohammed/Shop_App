import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_app/modules/shop_app/register/cubit/cubit.dart';
import 'package:first_app/modules/shop_app/register/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/shop_app/shop_layout.dart';
import '../../../shared/Network/local/cache_helper.dart';
import '../../../shared/componets/componets.dart';
import '../../../shared/componets/constants.dart';

class ShopRegisterScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  var nameControl = TextEditingController();
  var emailControl = TextEditingController();
  var passwordControl = TextEditingController();
  var phoneControl = TextEditingController();

  ShopRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (BuildContext context) => ShopRegisterCubit(),
        child: BlocConsumer<ShopRegisterCubit,ShopRegisterStates>
          (
          listener: (context, state)
          {
            if (state is ShopRegisterSuccessState)
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
          builder: (context, state)
          {
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Text(
                          'Register now to browse our hot offers ',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: nameControl,
                          type: TextInputType.name,
                          validate: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return'please enter your name';
                            }
                            return null;
                          },
                          label: "User name",
                          prefix: Icons.person,
                        ),
                        const SizedBox(
                          height: 15.0,
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
                            return null;
                          },
                          label: "email address",
                          prefix: Icons.email,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: passwordControl,
                          type: TextInputType.visiblePassword,
                          suffix: ShopRegisterCubit.get(context).suffix,
                          onSubmit: (value)
                          {
                            // if (formKey.currentState!.validate())
                            // {
                            //   ShopLoginCubit.get(context).userLOGIN(
                            //     email: emailControl.text,
                            //     password: passwordControl.text,
                            //   );
                            // }
                          },
                          isPassword: ShopRegisterCubit.get(context).isPassword,
                          suffixPressed: ()
                          {
                            ShopRegisterCubit.get(context).changePasswordVisibility();
                          },
                          validate: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return'password is too short';
                            }
                            return null;
                          },
                          label: "password",
                          prefix: Icons.lock,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: phoneControl,
                          type: TextInputType.phone,
                          validate: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return'please enter your phone number';
                            }
                            return null;
                          },
                          label: "phone number",
                          prefix: Icons.email,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingState,
                          builder: (BuildContext context) =>defaultButton(
                            function: () {
                              if (formKey.currentState!.validate())
                              {
                                ShopRegisterCubit.get(context).userRegister(
                                  name: nameControl.text,
                                  email: emailControl.text,
                                  password: passwordControl.text,
                                  phone: phoneControl.text,
                                );
                              }
                            },
                            text: "register",
                            isUpperCase: true,
                          ),
                          fallback: (BuildContext context) => const Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
