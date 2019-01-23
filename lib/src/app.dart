import 'package:flutter/material.dart';
import 'package:kwizny/src/blocs/authentication/authentication_bloc.dart';
import 'package:kwizny/src/ui/auth/decicion_screen.dart';
import 'package:kwizny/src/bloc_helpers/bloc_base.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kwizny',
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
  }
}
