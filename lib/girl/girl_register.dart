import 'package:flutter/material.dart';
import 'package:womenapp/components/custom_textfield.dart';
import 'package:womenapp/components/primary_button.dart';
import 'package:womenapp/components/secondary_button.dart';
import 'package:womenapp/girl/girl_login.dart';
import 'package:womenapp/utils/constant.dart';

class RegisterChild extends StatefulWidget {
  @override
  State<RegisterChild> createState() => _RegisterChildState();
}

class _RegisterChildState extends State<RegisterChild> {
  bool isPasswordShown = true;

  final _formKey = GlobalKey<FormState>();

  final _formData = Map<String, Object>();

  _onSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (_formData['password'] != _formData['cpassword']) {
        dialogue(context, 'password and confirm password must be equal');
      } else {
        // Navigate to login screen
        goTo(context, LoginScreen());
      }

      // Retrieve email and password from _formData
      String email = _formData['email'] as String;
      String password = _formData['password'] as String;

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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Register new user",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextfield(
                          hintText: 'enter name',
                          textInputAction: TextInputAction.next,
                          Keyboardtype: TextInputType.name,
                          prefix: Icon(Icons.person),
                          onsave: (value) {
                            _formData['name'] = value ?? "";
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null; // Return null if the input is valid
                          },
                        ),
                        SizedBox(height: 10),
                        CustomTextfield(
                          hintText: 'enter phone no.',
                          textInputAction: TextInputAction.next,
                          Keyboardtype: TextInputType.phone,
                          prefix: Icon(Icons.phone),
                          onsave: (value) {
                            _formData['phone'] = value ?? "";
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone number';
                            } else if (value.length < 10) {
                              return 'Phone number must be at least 10 digits';
                            }
                            return null; // Return null if the input is valid
                          },
                        ),
                        SizedBox(height: 10),
                        CustomTextfield(
                          hintText: 'enter email',
                          textInputAction: TextInputAction.next,
                          Keyboardtype: TextInputType.emailAddress,
                          prefix: Icon(Icons.email),
                          onsave: (value) {
                            _formData['email'] = value ?? "";
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
                        SizedBox(height: 10),
                        CustomTextfield(
                          hintText: 'enter parents email',
                          textInputAction: TextInputAction.next,
                          Keyboardtype: TextInputType.emailAddress,
                          prefix: Icon(Icons.email),
                          onsave: (value) {
                            _formData['pemail'] = value ?? "";
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
                        SizedBox(height: 10),
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
                                : Icon(Icons.visibility),
                          ),
                          onsave: (value) {
                            _formData['password'] = value ?? "";
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
                        SizedBox(height: 10),
                        CustomTextfield(
                          hintText: 'confirm password',
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
                                : Icon(Icons.visibility),
                          ),
                          onsave: (value) {
                            _formData['cpassword'] = value ?? "";
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
                        SizedBox(height: 20),
                        PrimaryButton(
                          title: "register",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _onSubmit();
                            }
                          },
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  SecondaryButton(
                    title: 'already a user?login',
                    onPressed: () {
                      goTo(context, LoginScreen());
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
