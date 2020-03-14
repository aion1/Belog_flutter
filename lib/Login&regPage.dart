import 'package:flutter/material.dart';

class LoginRegister extends StatefulWidget
{
    State<StatefulWidget> createState()
    {
      return _loginRegstate();
    }
}

class _loginRegstate extends State<LoginRegister>
{
  void MoveToRegester()
  {

  }
  void ValidateAndSave()
  {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Blog App"),
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Form(child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: createInputs() + createButtons(),
        )
        ),
      ),
    );
  }
List<Widget>createInputs()
{
  return
      [
        SizedBox(height: 10.0,),
        Logo(),
        SizedBox(height: 20.0,),
        TextField
        (
          decoration: InputDecoration(labelText: 'Eamil'),
        ),
        TextField
          (
          decoration: InputDecoration(labelText: 'Password'),
          ),
      ];
}

Widget Logo()
{
  return Hero
  (
    tag: 'hero',
    child: CircleAvatar
    (
      backgroundColor: Colors.transparent,
      radius: 110.0,
      child: Image.asset("Images/img.png"),
    ),
  );
}
  List<Widget>createButtons()
  {
    return
      [
        RaisedButton(
          child: Text(
            'Login',
            style: TextStyle(fontSize: 20.0)),
            textColor: Colors.white,
            color: Colors.black,
            onPressed: ValidateAndSave,
        ),
        FlatButton(
          child: Text(
              'Not have an Account? Create Account?',
              style: TextStyle(fontSize: 18.0)),
          textColor: Colors.red[600],
          color: Colors.transparent,
          onPressed: MoveToRegester,
        )
      ];
  }
}