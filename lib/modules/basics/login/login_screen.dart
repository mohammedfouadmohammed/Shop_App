import 'package:flutter/material.dart';

import '../../../shared/componets/componets.dart';



//reusable componets التقسيم
//1.timing
//2.refactor
//3.quality
//4.clean code

class loginscreen extends StatefulWidget
{
  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  var emailControl = TextEditingController();

  var passwordControl = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "login",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultFormField(
                    controller: emailControl,
                    type: TextInputType.emailAddress,
                     validate: (String? email)
                     {
                       if(email!.isEmpty){
                         return "email adress must not be empty";
                       }
                       return null ;
                    },
                    label: "Email Address",
                    prefix: Icons.email_rounded,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    controller: passwordControl,
                    type: TextInputType.visiblePassword,
                     validate: (String? pass)
                     {
                       if(pass!.isEmpty){
                         return "password must not be empty";
                       }
                       return null;
                     },
                    label: "Password",
                    prefix: Icons.lock,
                    suffix: isPass ? Icons.visibility_off_outlined : Icons.visibility,
                    suffixPressed: ()
                    {
                      setState(()
                      {
                        isPass = !isPass;
                      });
                    },
                    isPassword: isPass,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                      text: 'login',
                      isUpperCase: true,
                      function: ()
                      {
                        if(formKey.currentState!.validate())
                        {
                          print(emailControl.text);
                          print(passwordControl.text);
                        }

                      }),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                      text: 'rGisTER',
                      isUpperCase: true,
                      radius: 20.0,
                      background: Colors.red,
                      function: ()
                      {

                      }),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Don't haave an account? "
                      ),
                      TextButton(onPressed: (){},
                        child: Text(
                          "Register Now",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}