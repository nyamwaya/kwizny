import 'package:flutter/material.dart';
import 'package:kwizny/src/blocs/auth_event_bloc.dart';
import 'package:kwizny/src/blocs/bloc_auth_bloc.dart';
import 'package:kwizny/src/blocs/bloc_auth_state.dart';
import 'package:kwizny/src/blocs/bloc_base.dart';
import 'package:kwizny/src/blocs/event_state_builder.dart';
import 'package:kwizny/src/resources/repository.dart';
import 'package:kwizny/src/ui/auth/auth_page.dart';
import 'package:kwizny/src/ui/root_screen.dart';

class DecisionPage extends StatefulWidget {
  @override
  DecisionPageState createState() {
    return new DecisionPageState();
  }
}

class DecisionPageState extends State<DecisionPage> {
  AuthenticationState oldAuthenticationState;

  @override
  Widget build(BuildContext context) {
    AuthenticationBloc bloc = BlocProvider.of<AuthenticationBloc>(context);

    return BlocEventStateBuilder<AuthenticationEvent, AuthenticationState>(
        bloc: bloc,
        builder: (BuildContext context, AuthenticationState state) {
          if (state != oldAuthenticationState) {}
          bloc.currentUser.then((userId) {
            print("This is my ID $userId");
            if (userId == null) {
              //there is no user on file show login page
              if (state != oldAuthenticationState) {
                oldAuthenticationState = state;

                if (state.isAuthenticated) {
                  _redirectToPage(context, RootScreen("aleckson@gmail.com"));
                } else if (state.isAuthenticating || state.hasFailed) {
                  //do nothing
                } else{
                  _redirectToPage(context, AuthenticationPage());
                }
              }
            } else {
              //there is a user on file, redirect
              _redirectToPage(context, RootScreen("aleckson@gmail.com"));
            }
          });

          // if (state != oldAuthenticationState) {
          //   oldAuthenticationState = state;

          //   if (state.isAuthenticated) {
          //     _redirectToPage(context, RootScreen("aleckson@gmail.com"));
          //   } else if (state.isAuthenticating || state.hasFailed) {
          //     //do nothing
          //   } else {
          //     _redirectToPage(context, AuthenticationPage());
          //   }
          // }

          // This page does not need to display anything since it will
          // always remind behind any active page (and thus 'hidden').
          return Container();
        });
  }

  void _redirectToPage(BuildContext context, Widget page) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      MaterialPageRoute newRoute =
          MaterialPageRoute(builder: (BuildContext context) => page);

      Navigator.of(context)
          .pushAndRemoveUntil(newRoute, ModalRoute.withName('/decision'));
    });
  }
}
