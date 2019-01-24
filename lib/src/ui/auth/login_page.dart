import 'package:flutter/material.dart';
import 'package:kwizny/src/bloc_widgets/bloc_state_builder.dart';
import 'package:kwizny/src/blocs/authentication/authentication_bloc.dart';
import 'package:kwizny/src/blocs/authentication/authentication_state.dart';
import 'package:kwizny/src/bloc_helpers/bloc_base.dart';
import 'package:kwizny/src/ui/auth/login_form.dart';
import 'package:kwizny/src/ui/auth/registration_page.dart';
import 'package:kwizny/src/ui/home_page.dart';
import 'package:kwizny/src/widgets/log_out_button.dart';
import 'package:kwizny/src/widgets/pending_action.dart';
import 'package:kwizny/utils/StringConstant.dart';

class LoginPage extends StatelessWidget {
  ///
  /// Prevents the use of the "back" button
  ///
  Future<bool> _onWillPopScope() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    AuthenticationBloc bloc = BlocProvider.of<AuthenticationBloc>(context);

    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: BlocEventStateBuilder<AuthenticationState>(
              bloc: bloc,
              builder: (BuildContext context, AuthenticationState state) {
                if (state.isAuthenticating) {
                  //A loading loop
                  return PendingAction();
                }

                if (state.isAuthenticated) {
                  return HomePage();
                }

                if (state.hasFailed) {
                  print("Authentication failure!");

//                  final scaff = Scaffold.of(context);
//
//                  SnackBar(content: Text("Auth Failed"), duration: Duration(seconds: 5));
//
                }
                return Container(
                  child: LoginForm(
                    myBloc: bloc,
                    myState: state,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
