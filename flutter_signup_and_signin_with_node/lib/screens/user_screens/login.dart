import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signup_and_signin_with_node/bloc/user_bloc.dart';
import 'package:flutter_signup_and_signin_with_node/bloc/user_event.dart';
import 'package:flutter_signup_and_signin_with_node/bloc/user_state.dart';
import 'package:flutter_signup_and_signin_with_node/models/user.dart';

import 'package:flutter_signup_and_signin_with_node/screens/user_screens/signup.dart';

import '../loggedin_screen.dart';
import '../place_routes.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  final UserArgument args;
  LoginPage({this.args});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  //FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  _showerrormessega() {
    //SnackBar err =
    _globalKey.currentState.showSnackBar(SnackBar(content: Text("error")));
  }

  bool _loggedin = false;
  _login(ctx) async {
    setState(() {
      _loggedin = true;
    });

    final UserEvent loginevent = UserLogin(User(
        email: _emailcontroller.text.toString(),
        password: _passwordcontroller.text.toString()));

    BlocProvider.of<UserBloc>(ctx).add(loginevent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserOperationFailure) {
            _showerrormessega();

            print("Nope");
          }
          if (state is UsersLoadSuccess) {
            Navigator.pushNamed(context, LoggedinScreen.routeName);
            print("yess");
          }
        },
        builder: (context, state) {
          return _loginform(context);
        },
      ),
    );
  }

  Widget _loginform(context) {
    return Form(
      child: ListView(
        children: [
          Icon(Icons.login, size: 180, color: Colors.white),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: _emailcontroller,
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
            padding: EdgeInsets.all(20.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: _passwordcontroller,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                ),
                prefixIcon: Icon(
                  Icons.lock_open,
                  color: Colors.white.withOpacity(0.5),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: FlatButton(
              disabledColor: Colors.white.withOpacity(0.5),
              splashColor: Colors.white,
              color: Colors.grey[200],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed:
                  // _loggedin == true ? null :
                  () => _login(context),
              child: Text(
                "Log In",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, SignUp.routeName);
            },
            child: Text(
              "Don't Have An Account? Sign Up Here",
              style: TextStyle(
                color: Colors.white.withOpacity(1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
