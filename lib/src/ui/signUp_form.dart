import 'package:flutter/material.dart';
import 'package:kwizny/src/blocs/signup_bloc.dart';
import 'package:kwizny/src/blocs/bloc_base.dart';
import 'package:kwizny/src/ui/root_screen.dart';
import 'package:kwizny/utils/StringConstant.dart';
import 'package:kwizny/src/ui/login.dart';
import 'package:kwizny/src/blocs/login_bloc.dart';

class SignupForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SignUpBloc bloc = BlocProvider.of<SignUpBloc>(context);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            Column(
              children: <Widget>[logo(), titleText(), form(context, bloc)],
            )
          ],
        ),
      ),
    );
  }

  Widget logo() {
    return Container(
      child: Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.scaleDown,
      ),
    );
  }

  Text titleText() {
    return Text('Kwizny',
        style: TextStyle(
          color: Colors.red,
          fontFamily: 'Quicksand',
          fontSize: 32.0,
        ));
  }

  Container form(BuildContext context, SignUpBloc bloc) {
    return Container(
      padding: EdgeInsets.all(16),
      child: new Column(
        children: <Widget>[
        //  firstNameInput(bloc),
          emailInput(bloc),
          passwordInput(bloc),
       //   confirmPasswordInput(bloc),
          alreadyRegisteredButton(context),
         // submitSingupForm(bloc, context)
          submitButton(bloc, context)

          // + buildLoginButton() + buildRegister()
        ],
      ),
    );
  }

  void createUser(SignUpBloc bloc, BuildContext context) {
    bloc.showProgressBar(true);
    bloc.submit().then((value) {
      if (value.isNotEmpty) {
        print("Registered user: $value ");
        Navigator.pushReplacement(
            //page to open when happy path
            context,
            MaterialPageRoute(
                builder: (context) => RootScreen(bloc.emailAddress)));
      }
    });
  }

  // Widget firstNameInput(SignUpBloc bloc) {
  //   return StreamBuilder(
  //     stream: bloc.firstName,
  //     builder: (context, AsyncSnapshot<String> snapshot) {
  //       return TextField(
  //         decoration: InputDecoration(labelText: "first name"),
  //         onChanged: bloc.changeFirstName,
  //       );
  //     },
  //   );
  // }

  Widget emailInput(SignUpBloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, AsyncSnapshot<String> snapshot) {
        return Card(
          child: TextField(
            onChanged: bloc.changeEmail,
            decoration: InputDecoration(
                hintText: StringConstant.emailHint, errorText: snapshot.error),
          ),
        );
      },
    );
  }

  Widget passwordInput(SignUpBloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          decoration: new InputDecoration(
              hintText: StringConstant.passwordHint, errorText: snapshot.error),
          obscureText: true,
        );
      },
    );
  }

  // Widget confirmPasswordInput(SignUpBloc bloc) {
  //   return StreamBuilder(
  //       stream: bloc.confirmPassword,
  //       builder: (context, AsyncSnapshot<String> snapshot) {
  //         return TextField(
  //           onChanged: bloc.changeConfirmPassword,
  //           decoration: new InputDecoration(
  //               labelText: StringConstant.passwordHint,
  //               errorText: snapshot.error),
  //           obscureText: true,
  //         );
  //       });
  // }

  FlatButton alreadyRegisteredButton(BuildContext context) {
    return FlatButton(
        child: Text("Have an account? Sign In.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black38,
              fontSize: 15.0,
              fontFamily: 'Quicksand',
            )),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider<LoginBloc>(
                      bloc: LoginBloc(),
                      child: LoginScreen(),
                    )),
          );
        });
  }

  // Widget submitSingupForm(SignUpBloc bloc, BuildContext context) {
  //   return StreamBuilder(
  //     stream: bloc.signUpStatus,
  //     builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
  //       if (!snapshot.hasData || snapshot.hasError) {
  //         return signUpButton(bloc, context);
  //       } else {
  //         return CircularProgressIndicator();
  //       }
  //     },
  //   );
  // }

    Widget submitButton(SignUpBloc bloc, BuildContext context) {
    return StreamBuilder(
        stream: bloc.signUpStatus,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return button(bloc, context);
          } else {
            return CircularProgressIndicator();
          }
        });
  }

    Widget button(SignUpBloc bloc, BuildContext context) {
    return RaisedButton(
        child: Text(StringConstant.signUp),
        textColor: Colors.white,
        color: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        onPressed: () {
          if (bloc.validateFields()) {
            createUser(bloc, context);
          } else {
            showErrorMessage(context);
          }
        });
  }

  void showErrorMessage(BuildContext context) {
    final snackbar = SnackBar(
        content: Text(StringConstant.errorMessage),
        duration: new Duration(seconds: 3));
    Scaffold.of(context).showSnackBar(snackbar);
  }
}
