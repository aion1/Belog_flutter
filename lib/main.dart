import 'package:flutter/material.dart';
import 'Login&regPage.dart';
void main() =>runApp(new Blog_App());

class Blog_App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: "Blog App",
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
        home: LoginRegister(),

      );
  }
}