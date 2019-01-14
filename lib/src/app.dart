import 'package:flutter/material.dart';
import 'package:kwizny/src/ui/login.dart';
import 'package:kwizny/src/blocs/bloc_base.dart';
import 'package:kwizny/src/blocs/login_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LoginPage',
        home: BlocProvider<LoginBloc>(
          bloc: LoginBloc(),
          child: LoginScreen(),
        ));

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
