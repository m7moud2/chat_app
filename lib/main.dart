import 'package:chat_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(ChatApp());

}

class ChatApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogInScreen(),
    );
  }

}
