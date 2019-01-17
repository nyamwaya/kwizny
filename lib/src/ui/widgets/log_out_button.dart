
import 'package:flutter/material.dart';
import 'package:kwizny/src/blocs/auth_event_bloc.dart';
import 'package:kwizny/src/blocs/bloc_auth_bloc.dart';
import 'package:kwizny/src/blocs/bloc_base.dart';

class LogOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthenticationBloc bloc = BlocProvider.of<AuthenticationBloc>(context);
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        bloc.emitEvent(AuthenticationEventLogout());
      },
    );
  }
}