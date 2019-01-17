import 'package:flutter/material.dart';
import 'package:kwizny/src/blocs/bloc_auth_bloc.dart';
import 'package:kwizny/src/ui/decicion_screen.dart';
import 'package:kwizny/src/ui/login.dart';
import 'package:kwizny/src/blocs/bloc_base.dart';
import 'package:kwizny/src/blocs/login_bloc.dart';
import 'package:firebase_core/firebase_core.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LoginPage',
        home: BlocProvider<AuthenticationBloc>(
          bloc: AuthenticationBloc(),
          child: MaterialApp(
                       title: 'Kwizny',
            theme: ThemeData(
              primarySwatch: Colors.red
            ),
            home: DecisionPage(),
          )
 
          ),
        );

    // return LoginBlocProvider(
    //   child: GoalsBlocProvider(
    //     child: MaterialApp(
    //       theme: ThemeData(
    //         accentColor: Colors.black,
    //         primaryColor: Colors.amber,
    //       ),
    //       home: Scaffold(
    //         appBar: AppBar(
    //           title: Text(
    //             "Goals",
    //             style: TextStyle(color: Colors.black),
    //           ),
    //           backgroundColor: Colors.amber,
    //           elevation: 0.0,
    //         ),
    //         body: LoginScreen(),
    //       ),
    //     ),
    //   ),
    // );
  }
}
