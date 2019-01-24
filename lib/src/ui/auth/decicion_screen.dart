
import 'package:flutter/material.dart';
import 'package:kwizny/src/bloc_widgets/bloc_state_builder.dart';
import 'package:kwizny/src/blocs/authentication/authentication_bloc.dart';
import 'package:kwizny/src/blocs/authentication/authentication_state.dart';
import 'package:kwizny/src/bloc_helpers/bloc_base.dart';
import 'package:kwizny/src/ui/auth/login_page.dart';
import 'package:kwizny/src/ui/home_page.dart';

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

    return BlocEventStateBuilder<AuthenticationState>(
        bloc: bloc,
        builder: (BuildContext context, AuthenticationState state) {
          if (state != oldAuthenticationState) {
            bloc.currentUser.then((userId) {

              if (state.isAuthenticated || userId != null) {
                _redirectToPage(context, HomePage());
              } else if (state.isAuthenticating || state.hasFailed) {
                //do nothing
              }else {
                _redirectToPage(context, LoginPage());
              }
              // print("This is my ID $userId");
              // if (userId == null) {
              //   //there is no user on file show login page
              //   if (state != oldAuthenticationState) {
              //     oldAuthenticationState = state;

              //     if (state.isAuthenticated) {
              //       _redirectToPage(context, HomePage("aleckson@gmail.com"));
              //     } else if (state.isAuthenticating || state.hasFailed) {
              //       //do nothing
              //     } else {
              //       _redirectToPage(context, LoginPage());
              //     }
              //   }
              // } else {
              //   //there is a user on file, redirect
              //   _redirectToPage(context, HomePage("aleckson@gmail.com"));
              // }
            });
          }
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
