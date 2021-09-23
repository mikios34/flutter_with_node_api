import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_signup_and_signin_with_node/bloc/user_bloc.dart';
import 'package:flutter_signup_and_signin_with_node/repository/repository.dart';
import 'package:flutter_signup_and_signin_with_node/screens/place_routes.dart';

import 'bloc/bloc.dart';
import 'bloc_observer.dart';
import 'data_provider/data_provider.dart';
import 'package:http/http.dart' as http;

void main() {
  Bloc.observer = SimpleBlocObserver();

  final UserRepository userRepository = UserRepository(
    dataProvider: UserDataProvider(
      httpClient: http.Client(),
    ),
  );

  runApp(MyApp(userRepository: userRepository));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  MyApp({@required this.userRepository}) : assert(userRepository != null);
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: this.userRepository,
        ),
      ],
      //value: this.placeRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserBloc(userRepository: this.userRepository),
          ),
        ],
        child: MaterialApp(
          title: 'Place App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: PlaceRout.generateRoute,
        ),
      ),
    );
  }
}
