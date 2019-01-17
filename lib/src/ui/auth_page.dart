
import 'package:flutter/material.dart';
import 'package:kwizny/src/blocs/auth_event_bloc.dart';
import 'package:kwizny/src/blocs/bloc_auth_bloc.dart';
import 'package:kwizny/src/blocs/bloc_auth_state.dart';
import 'package:kwizny/src/blocs/bloc_base.dart';
import 'package:kwizny/src/blocs/event_state_builder.dart';
import 'package:kwizny/src/ui/widgets/pending_action.dart';


class AuthenticationPage extends StatelessWidget {
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
          appBar: AppBar(
            title: Text('Authentication Page'),
            leading: Container(),
          ),
          body: Container(
            child:
                BlocEventStateBuilder<AuthenticationEvent, AuthenticationState>(
              bloc: bloc,
              builder: (BuildContext context, AuthenticationState state) {
                if (state.isAuthenticating) {
                  //find out how to put a loading loop
                  return PendingAction();
                }

                if (state.isAuthenticated){
                  return Container();
                }
                
                List<Widget> children = <Widget>[];

                // Button to fake the authentication (success)
                children.add(
                  ListTile(
                      title: RaisedButton(
                        child: Text('Log in (success)'),
                        onPressed: () {
                            bloc.emitEvent(AuthenticationEventLogin(name: 'Didier'));
                        },
                      ),
                    ),
                );

                // Button to fake the authentication (failure)
                children.add(
                  ListTile(
                      title: RaisedButton(
                        child: Text('Log in (failure)'),
                        onPressed: () {
                            bloc.emitEvent(AuthenticationEventLogin(name: 'failure'));
                        },
                      ),
                    ),
                );

                // Display a text if the authentication failed
                if (state.hasFailed){
                  children.add(
                    Text('Authentication failure!'),
                  );
                }

                return Column(
                  children: children,
                );    
              },
            ),
          ),
        ),
      ),
    );
  }
}