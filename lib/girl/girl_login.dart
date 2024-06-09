import 'package:flutter/material.dart';
import 'package:womenapp/components/custom_textfield.dart';
import 'package:womenapp/components/primary_button.dart';
import 'package:womenapp/components/secondary_button.dart';
import 'package:womenapp/girl/girl_register.dart';
import 'package:womenapp/parent/parentregisterscreen.dart';
import 'package:womenapp/utils/constant.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // const LoginScreen({Key? key}) : super(key: key);
  bool isPasswordShown = true;
  final _formKey = GlobalKey<FormState>();
  final _formdata = Map<String, Object>();

  _onSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save the form data

      // Retrieve email and password from _formData
      String email = _formdata['email'] as String;
      String password = _formdata['password'] as String;

      print('Email: $email');
      print('Password: $password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(220, 112, 128, 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomTextfield(
                            hintText: 'enter email',
                            textInputAction: TextInputAction.next,
                            Keyboardtype: TextInputType.emailAddress,
                            prefix: Icon(Icons.email),
                            onsave: (value) {
                              _formdata['email'] = value ?? "";
                            },
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter an email';
                              } else if (!value.contains('@')) {
                                return 'Please enter a valid email';
                              }
                              return null; // Return null if the input is valid
                            },
                          ),
                          CustomTextfield(
                            hintText: 'enter password',
                            isPassword: isPasswordShown,
                            prefix: Icon(Icons.password),
                            suffix: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPasswordShown = !isPasswordShown;
                                  });
                                },
                                icon: isPasswordShown
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility)),
                            onsave: (value) {
                              _formdata['password'] = value ?? "";
                            },
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a password';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null; // Return null if the input is valid
                            },
                          ),
                          PrimaryButton(
                            title: "login",
                            onPressed: () {
                              progressIndicator(context);
                              // if (_formKey.currentState!.validate()) {
                              //   _onSubmit();
                              // }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "forgot password?",
                          style: TextStyle(fontSize: 18),
                        ),
                        SecondaryButton(title: 'click here', onPressed: () {}),
                      ],
                    ),
                  ),
                  SecondaryButton(
                      title: 'register new user',
                      onPressed: () {
                        goTo(context, RegisterChild());
                      }),
                  SecondaryButton(
                      title: 'register as parent',
                      onPressed: () {
                        goTo(context, RegisterParent());
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
