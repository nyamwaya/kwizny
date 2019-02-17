import 'package:flutter/material.dart';
import 'package:kwizny/src/bloc_helpers/bloc_base.dart';
import 'package:kwizny/src/blocs/authentication/authentication_bloc.dart';
import 'package:kwizny/src/blocs/home/home_bloc.dart';
import 'package:kwizny/src/ui/auth/decicion_screen.dart';
import 'package:kwizny/src/ui/auth/registration_page.dart';

///
///For every page, remember to include it's bloc here
///https://stackoverflow.com/questions/52732892/blocprovider-not-available-within-inherited-widget


class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
        bloc: AuthenticationBloc(),
        child: BlocProvider<HomeBloc>(
          bloc: HomeBloc(),
          child: MaterialApp(title: 'Kwizny', home: DecisionPage(), routes: {
            '/decision': (BuildContext context) => DecisionPage(),
            '/register': (BuildContext context) => RegistrationPage(),
          }),
        ));
  }
}
