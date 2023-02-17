import 'package:flutter_amazon_clone/layout/screen_layout.dart';
import 'package:flutter_amazon_clone/resources/authentication_methods.dart';
import 'package:flutter_amazon_clone/screens/sign_up_screen.dart';
import 'package:flutter_amazon_clone/utils/color_themes.dart';
import 'package:flutter_amazon_clone/utils/constants.dart';
import 'package:flutter_amazon_clone/utils/utils.dart';
import 'package:flutter_amazon_clone/widgets/custom_main_button.dart';
import 'package:flutter_amazon_clone/widgets/text_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Amazon Logo

                  Image.network(
                    amazonLogo,
                    height: screenSize.height * 0.08,
                  ),
                  Expanded(
                    child: Container(
                      height: screenSize.height * 0.6,
                      width: screenSize.width * 0.8,
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Sign-In",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 33),
                          ),

                          // Email Password Textfields

                          TextFieldWidget(
                            title: "Email",
                            controller: emailController,
                            obscureText: false,
                            hintText: "Enter your email",
                          ),
                          TextFieldWidget(
                            title: "Password",
                            controller: passwordController,
                            obscureText: true,
                            hintText: "Enter your password",
                          ),

                          // SignIn Button

                          Align(
                            alignment: Alignment.center,
                            child: CustomMainButton(
                                child: const Text(
                                  "Sign In",
                                  style: TextStyle(
                                      letterSpacing: 0.6, color: Colors.black),
                                ),
                                color: yellowColor,
                                isLoading: isLoading,
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });

                                  String output =
                                      await authenticationMethods.signInUser(
                                          email: emailController.text,
                                          password: passwordController.text);
                                  setState(() {
                                    isLoading = false;
                                  });
                                  if (output == "success") {
                                    //functions
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const ScreenLayout()));
                                  } else {
                                    //error
                                    Utils().showSnackBar(
                                        context: context, content: output);
                                  }
                                }),
                          )
                        ],
                      ),
                    ),
                  ),

                  // New to Amazon?

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "New to Amazon?",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  // Create Account Button

                  CustomMainButton(
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                        letterSpacing: 0.6,
                        color: Colors.black,
                      ),
                    ),
                    color: Colors.grey[400]!,
                    isLoading: false,
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const SignUpScreen();
                      }));
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Made by Ishan @ Biencaps',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
