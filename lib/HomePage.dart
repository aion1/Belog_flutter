import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Authentication.dart';

class HomePage extends StatefulWidget
{
  final AuthImplementation auth;
  final VoidCallback onSignedout;
  HomePage({
    this.auth,
    this.onSignedout,
  });
  @override
  State<StatefulWidget> createState()
  {
    return _Homepagetate();
  }
}

class _Homepagetate extends State<HomePage> {

  void _logoutUser() async
  {
    try
    {
      await widget.auth.signOut();
      widget.onSignedout();
    }
    catch(e)
    {
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container
        (

      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          margin: const EdgeInsets.only(left: 50.0,right: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,

            children: <Widget>[
              IconButton
                (
                icon: Icon(Icons.settings),
                iconSize: 40,
                color: Colors.black,
                onPressed: _logoutUser,
              ),
              IconButton
                (
                icon: Icon(Icons.add_a_photo),
                iconSize: 40,
                color: Colors.black,
                onPressed: null,
              ),
            ],
          ),
        ),
      ),
    );
  }

}