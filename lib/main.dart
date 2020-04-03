import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'Login&regPage.dart';
import 'mapping.dart';
import 'Authentication.dart';
void main() =>runApp(new Blog_App());

class Blog_App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Blog App",
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: MappingPage(auth: Auth(),),

    );
  }
}