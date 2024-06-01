import 'package:chat_app/colors/color_app.dart';
import 'package:chat_app/screens/home_chat.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/widget/custom_elevated_button.dart';
import 'package:chat_app/widget/custom_text_from_field.dart';
import 'package:flutter/material.dart';

class RegistScreen extends StatefulWidget {
  const RegistScreen({super.key});

  @override
  State<RegistScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<RegistScreen> {
  final formKey = GlobalKey<FormState>();
    bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 110, bottom: 15, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/logo.png'),
                  height: 100,
                  width: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Create an account',
                  style: TextStyle(
                      color: AppColor.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFromField(
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'Enter your Name';
                    }
                    return null;
                  },
                  prefixIcon: Icons.person,
                  hintText: 'Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFromField(
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'Enter your Email';
                    }
                    return null;
                  },
                  prefixIcon: Icons.email,
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFromField(
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'Enter your Password';
                    }
                    return null;
                  },
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  suffixIcon:
                      obscureText ? Icons.visibility : Icons.visibility_off,
                  prefixIcon: Icons.lock,
                  hintText: 'Password',
                  obscureText: obscureText,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return HomeChat();
                        },
                      ));
                    }
                  },
                  text: 'Regist',
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'if u have an account',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return const LogInScreen();
                          },
                        ));
                      },
                      child: Text(
                        'login now',
                        style: TextStyle(
                          color: AppColor.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
