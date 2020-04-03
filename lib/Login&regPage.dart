import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Authentication.dart';
import 'DialogBox.dart';
class LoginRegister extends StatefulWidget
{

  LoginRegister({
    this.auth,
    this.onSignedIn,
  });
  final AuthImplementation auth;
  final VoidCallback onSignedIn;
  State<StatefulWidget> createState()
  {
    return _loginRegstate();
  }
}
enum FormType
{
  login,
  register
}

class _loginRegstate extends State<LoginRegister>
{
  DialogBox dialogBox = new DialogBox();
  final formKey = new GlobalKey<FormState>();
  FormType _formType = FormType.login;
  String _email = '';
  String _password = '';



  void MoveToRegister()
  {
    formKey.currentState.reset();

    setState(() {
      _formType = FormType.register;
    });
  }
  void MoveToLogin()
  {
    formKey.currentState.reset();

    setState(() {
      _formType = FormType.login;
    });
  }
  bool ValidateAndSave()
  {
    final form = formKey.currentState;
    if(form.validate())
    {
      form.validate();
      return true;
    }
    else {
      return false;
    }
  }
  void validateAndSubmit() async
  {
    if(ValidateAndSave())
    {
      try{
        if(_formType == FormType.login)
        {
          String  userId = await widget.auth.Signin(_email,_password);
          dialogBox.information(context,"Congratulations! ","you have logged in successfully.");
          print("login userid = "+userId);
        }
        else
        {
          String userId = await widget.auth.Signup(_email, _password);
          dialogBox.information(context,"Congratulations","Your account has been Created successfully");
          print("Register userId = " + userId);
        }
        widget.onSignedIn();
      }
      catch(e)
      {
        dialogBox.information(context,"Error = ",e.toString());
        print("Error = "+e.toString());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Blog App"),
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Form(
          child: Form(
              key:formKey,
              child:
              Column (
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: createInputs() + createButtons(),
              )
          ),
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
        TextFormField
        (
          decoration: InputDecoration(labelText: 'Eamil'),
          validator: (value)
          {
            return value.isEmpty ? 'Email is required.' : null;
          },
          onSaved: (value)
          {
            return _email = value;
          },
        ),
        new TextFormField
          (
          decoration: InputDecoration(labelText: 'Password'),
          validator: (value)
          {
            return value.isEmpty ? 'password is required.' : null;
          },
          onSaved: (value)
          {
            return _password = value;
          },
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
    if(_formType == FormType.login)
    {
      return
        [
          RaisedButton(
            child: Text(
                'Login',
                style: TextStyle(fontSize: 20.0)),
            textColor: Colors.white,
            color: Colors.black,
            onPressed: validateAndSubmit,
          ),
          FlatButton(
            child: Text(
                'Not have an Account? Create Account?',
                style: TextStyle(fontSize: 18.0)),
            textColor: Colors.red[600],
            color: Colors.transparent,
            onPressed: MoveToRegister,
          ),
        ];
    }
    else
    {
      return
        [
          RaisedButton(
            child: Text(
                'Create an Account',
                style: TextStyle(fontSize: 20.0)),
            textColor: Colors.white,
            color: Colors.black,
            onPressed: validateAndSubmit,
          ),
          FlatButton(
            child: Text(
                'Already Have an Account?',
                style: TextStyle(fontSize: 18.0)),
            textColor: Colors.red[600],
            color: Colors.transparent,
            onPressed: validateAndSubmit,
          )
        ];
    }
  }
}