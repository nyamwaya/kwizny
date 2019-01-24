import 'package:flutter/material.dart';
import 'package:kwizny/src/blocs/authentication/authentication_bloc.dart';
import 'package:kwizny/src/ui/auth/decicion_screen.dart';
import 'package:kwizny/src/bloc_helpers/bloc_base.dart';
import 'package:kwizny/src/ui/auth/registration_page.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      bloc: AuthenticationBloc(),
      child: MaterialApp(title: 'Kwizny', home: DecisionPage(), routes: {
        '/decision': (BuildContext context) => DecisionPage(),
        '/register': (BuildContext context) => RegistrationPage(),
      }),
    );
  }
}
