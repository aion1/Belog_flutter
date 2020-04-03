import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthImplementation
{
  Future<String> Signin(String email,String password);
  Future<String> Signup(String email,String password);
  Future<String> getCurrentUser();
  Future<void>signOut();
}

class Auth implements AuthImplementation
{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Function get onError => null;

  Future<String> Signin(String email,String password) async
  {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user =result.user;
    return user.uid;
  }
  Future<String> Signup(String email,String password) async
  {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user =result.user;
    return user.uid;
  }
  Future<void>signOut() async
  {
    _firebaseAuth.signOut();
  }
  Future<String> getCurrentUser() async
  {
    FirebaseUser User = await _firebaseAuth.currentUser();
    return User.uid;
  }
}