import 'package:flutter/material.dart';
import 'package:kwizny/src/blocs/auth_event_bloc.dart';
import 'package:kwizny/src/blocs/bloc_auth_bloc.dart';
import 'package:kwizny/src/blocs/bloc_auth_state.dart';
import 'package:kwizny/src/blocs/bloc_base.dart';
import 'package:kwizny/src/blocs/event_state_builder.dart';
import 'package:kwizny/src/ui/auth/registration_page.dart';
import 'package:kwizny/src/ui/root_screen.dart';
import 'package:kwizny/src/ui/widgets/log_out_button.dart';
import 'package:kwizny/src/ui/widgets/pending_action.dart';
import 'package:kwizny/utils/StringConstant.dart';

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
            title: Text('Login'),
            leading: Container(),
          ),
          body: Container(
            child:
                BlocEventStateBuilder<AuthenticationEvent, AuthenticationState>(
              bloc: bloc,
              builder: (BuildContext context, AuthenticationState state) {
                if (state.isAuthenticating) {
                  //A loading loop
                  return PendingAction();
                }

                if (state.isAuthenticated) {
                  //show home page
                  return Container(
                    child: LogOutButton(),
                  );
                }

                //  loginContent(bloc, context);

                List<Widget> children = <Widget>[];

                children.add(StreamBuilder(
                    stream: bloc.email,
                    builder: (context, snapshot) {
                      return Container(
                        padding: EdgeInsets.only(right: 16, left: 16),
                        child: TextField(
                          onChanged: bloc.onEmailChanged,
                          decoration: InputDecoration(
                              hintText: StringConstant.emailHint,
                              errorText: snapshot.error),
                        ),
                      );
                    }));

                //Spacer
                children.add(
                  Container(margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
                );

                children.add(
                  StreamBuilder(
                    stream: bloc.password,
                    builder: (BuildContext context, AsyncSnapshot<String> snapshot){
                      return TextField(
                        decoration: InputDecoration(
                          labelText: 'password',
                          errorText: snapshot.error
                        ),
                        obscureText: false,
                        onChanged: bloc.onPasswordChanged,
                      );
                    },
                  )
                );
              

                // children.add(StreamBuilder(
                //   stream: bloc.password,
                //   builder: (context, AsyncSnapshot<String> snapshot) {
                //     return Container(
                //       padding: EdgeInsets.only(right: 16, left: 16),
                //       child: TextField(
                //         onChanged: bloc.onPasswordChanged,
                //         obscureText: true,
                //         decoration: InputDecoration(
                //             hintText: StringConstant.passwordHint,
                //             errorText: snapshot.error),
                //       ),
                //     );
                //   },
                // ));

                //Spacer
                children.add(
                  Container(margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
                );

                //Login button
                // children.add(RaisedButton(
                //     child: Text(StringConstant.login),
                //     textColor: Colors.white,
                //     color: Colors.red,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: new BorderRadius.circular(30.0)),
                //     onPressed: () {
                //       bloc.emitEvent(
                //           AuthenticationEventLogin(name: 'Aleckson'));
                //       // if (bloc.validateFields()) {
                //       //   createUser(bloc, context);
                //       // } else {
                //       //   showErrorMessage(context);
                //       // }
                //     }));

                children.add(Container(
                  child: StreamBuilder<bool>(
                    stream: bloc.registerValid,
                    builder:
                        (BuildContext context, AsyncSnapshot<bool> snapshot) {
                      return RaisedButton(
                        child: Text(StringConstant.login),
                        textColor: Colors.white,
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: (snapshot.hasData && snapshot.data == true)
                            ? () {
                                bloc.emitEvent(
                                    AuthenticationEventLogin(name: 'Aleckson'));
                                // launch the registration process
                                // maybe confirm
                              }
                            : null,
                      );
                    },
                  ),
                ));

                //Sign up button
                children.add(RaisedButton(
                    child: Text(StringConstant.signUp),
                    textColor: Colors.white,
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationForm()));
                      // if (bloc.validateFields()) {
                      //   createUser(bloc, context);
                      // } else {
                      //   showErrorMessage(context);
                      // }
                    }));

                // Button to fake the authentication (success)
                // children.add(
                //   ListTile(
                //     title: RaisedButton(
                //       child: Text('Log in (success)'),
                //       onPressed: () {
                //         bloc.emitEvent(
                //             AuthenticationEventLogin(name: 'Didier'));
                //       },
                //     ),
                //   ),
                // );

                // // Button to fake the authentication (failure)
                // children.add(
                //   ListTile(
                //     title: RaisedButton(
                //       child: Text('Log in (failure)'),
                //       onPressed: () {
                //         bloc.emitEvent(
                //             AuthenticationEventLogin(name: 'failure'));
                //       },
                //     ),
                //   ),
                // );

                // Display a text if the authentication failed
                if (state.hasFailed) {
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
