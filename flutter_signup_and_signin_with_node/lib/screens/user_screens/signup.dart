import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signup_and_signin_with_node/bloc/user_bloc.dart';
import 'package:flutter_signup_and_signin_with_node/bloc/user_event.dart';
import 'package:flutter_signup_and_signin_with_node/models/user.dart';

import '../place_routes.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/signup';
  final UserArgument args;
  SignUp({this.args});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  //FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GlobalKey<ScaffoldState> _scafoldState = GlobalKey<ScaffoldState>();
  bool _loggedin = false;
  _signup(ctx) async {
    setState(() {
      _loggedin = true;
    });

    UserEvent signupevent = UserCreate(User(
        email: _emailController.text.toString(),
        phone: "09341235643",
        isAdmin: false,
        name: _nameController.text.toString(),
        password: _passwordController.text.toString()));

    BlocProvider.of<UserBloc>(ctx).add(signupevent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldState,
      backgroundColor: Theme.of(context).primaryColor,
      body: Form(
        child: ListView(
          children: [
            Icon(Icons.login_rounded, size: 180, color: Colors.white),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Email Or Phone Number",
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  prefixIcon: Icon(
                    Icons.alternate_email,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  prefixIcon: Icon(
                    Icons.lock_open,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: _confirmpasswordController,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  prefixIcon: Icon(
                    Icons.lock_open,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: FlatButton(
                splashColor: Colors.white,
                color: Colors.grey[200],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: _loggedin == true
                    ? null
                    : () => _signup(context), // _login(),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            ),
            FlatButton(
              splashColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Already Have An Account? Sign In Here",
                style: TextStyle(
                  color: Colors.white.withOpacity(1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
