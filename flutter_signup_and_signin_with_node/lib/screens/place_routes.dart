import 'package:flutter/material.dart';
import 'package:flutter_signup_and_signin_with_node/models/user.dart';


import 'package:flutter_signup_and_signin_with_node/screens/user_screens/login.dart';
import 'package:flutter_signup_and_signin_with_node/screens/user_screens/signup.dart';

class PlaceRout {
  static Route generateRoute(RouteSettings settings) {
    

    

  
    if (settings.name == SignUp.routeName) {
      //User user = settings.arguments;
      return MaterialPageRoute(
        builder: (context)=> SignUp()
      );
      

    }
  

    return MaterialPageRoute(builder: (context) => LoginPage());
  }
}


class UserArgument{
  final User user;
  final bool edit;
  UserArgument({this.user,this.edit});
}