import 'package:chat_app/colors/color_app.dart';
import 'package:chat_app/screens/home_chat.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:chat_app/widget/custom_elevated_button.dart';
import 'package:chat_app/widget/custom_text_from_field.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final FormKey = GlobalKey<FormState>();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
            key: FormKey,
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
                  'Login to your account',
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
                    if (FormKey.currentState!.validate()) {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return HomeChat();
                        },
                      ));
                    }
                  },
                  text: 'Login',
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'if you haven\'t an account',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return const RegistScreen();
                          },
                        ));
                      },
                      child: Text(
                        'Create onr!',
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
