import 'package:flutter/material.dart';
import 'Login&regPage.dart';
import 'HomePage.dart';
import 'Authentication.dart';

class MappingPage extends StatefulWidget
{
  final AuthImplementation auth;

  MappingPage({
    this.auth,
  });
  State<StatefulWidget> createState()
  {
    return _MappingPageState();
  }

}
enum AuthState
{
  notSignedIn,
  signedIn,
}
class _MappingPageState extends State<MappingPage>{
  AuthState authStatus = AuthState.notSignedIn;
  void initState()
  {
    super.initState();

    widget.auth.getCurrentUser().then((firbaseUserId)
    {
      setState(() {
        authStatus = firbaseUserId == null ? AuthState.notSignedIn:AuthState.signedIn;
      });
    });
  }
  @override
  Widget build(BuildContext context)
  {
    switch(authStatus)
    {
      case AuthState.notSignedIn:
        return new LoginRegister(
          auth:widget.auth,
          onSignedIn: _signedIn,
        );
      case AuthState.signedIn:
        return new HomePage(
          auth: widget.auth,
          onSignedout: _signOut,
        );
    }

    return null;
  }

  void _signedIn() {
    setState(() {
      authStatus = AuthState.signedIn;

    });
  }


  void _signOut() {
    setState(() {
      authStatus = AuthState.notSignedIn;
    });
  }
}
