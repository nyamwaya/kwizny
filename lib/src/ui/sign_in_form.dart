import 'package:kwizny/utils/StringConstant.dart';
import 'package:flutter/material.dart';
import 'package:kwizny/src/blocs/login_bloc.dart';
import 'package:kwizny/src/blocs/bloc_base.dart';
import 'package:kwizny/src/ui/root_screen.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginBloc bloc = BlocProvider.of<LoginBloc>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        emailField(bloc),
        Container(margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
        passwordField(bloc),
        Container(margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
        submitButton(bloc, context)
      ],
    );
  }

  Widget passwordField(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return Card(
            child: TextField(
              onChanged: bloc.changePassword,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: StringConstant.passwordHint,
                  errorText: snapshot.error),
            ),
          );
        });
  }

  Widget emailField(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return Card(
            child: TextField(
              onChanged: bloc.changeEmail,
              decoration: InputDecoration(
                  hintText: StringConstant.emailHint,
                  errorText: snapshot.error),
            ),
          );
        });
  }

  Widget submitButton(LoginBloc bloc, BuildContext context) {
    return StreamBuilder(
        stream: bloc.signInStatus,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return button(bloc, context);
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  Widget button(LoginBloc bloc, BuildContext context) {
    return RaisedButton(
        child: Text(StringConstant.submit),
        textColor: Colors.white,
        color: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        onPressed: () {
          if (bloc.validateFields()) {
            authenticateUser(bloc, context);
          } else {
            showErrorMessage(context);
          }
        });
  }

  void authenticateUser(LoginBloc bloc, BuildContext context) {
    bloc.showProgressBar(true);
    bloc.submit().then((value) {
      if (value == 0) {
        //New User
        bloc.registerUser().then((value) {
          Navigator.pushReplacement(
              //page to open when happy path
              context,
              MaterialPageRoute(
                  builder: (context) => RootScreen(bloc.emailAddress)));
        });
      } else {
        //Already registered
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => RootScreen(bloc.emailAddress)));
      }
    });
  }

  void showErrorMessage(BuildContext context) {
    final snackbar = SnackBar(
        content: Text(StringConstant.errorMessage),
        duration: new Duration(seconds: 2));
    Scaffold.of(context).showSnackBar(snackbar);
  }

//   @override
//   SignInFormState createState() {
//     return SignInFormState();
//   }
// }

// class SignInFormState extends State<SignInForm> {
//   LoginBloc _bloc;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _bloc = LoginBlocProvider.of(context);
//   }

//   @override
//   void dispose() {
//     _bloc.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final LoginBloc bloc = BlocProvider.of<LoginBloc>(context);

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         emailField(),
//         Container(margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
//         passwordField(),
//         Container(margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
//         submitButton()
//       ],
//     );
//   }

}
