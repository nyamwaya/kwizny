import 'package:flutter/material.dart';
import 'package:kwizny/src/blocs/authentication/authentication_bloc.dart';
import 'package:kwizny/src/blocs/authentication/authentication_event.dart';
import 'package:kwizny/src/blocs/authentication/authentication_state.dart';
import 'package:kwizny/src/ui/auth/registration_page.dart';
import 'package:kwizny/utils/StringConstant.dart';

class LoginForm extends StatelessWidget {
  final AuthenticationBloc myBloc;
  final AuthenticationState myState;
  LoginForm({this.myBloc, this.myState});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[_logo(), _loginForm(context)],
      ),
    );
  }

  Widget _logo() {
    return Container(
      padding: EdgeInsets.only(top: 16),
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: <Widget>[
          ClipRect(
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Kwizny',
            style: TextStyle(
              color: Color(0xfffd4241),
              fontSize: 28.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 24),
          ),
          Container(
              child: StreamBuilder(
                  stream: myBloc.email,
                  builder: (context, snapshot) {
                    return Container(
                      //padding: EdgeInsets.only(right: 16, left: 16),
                      child: TextField(
                        onChanged: myBloc.onEmailChanged,
                        decoration: InputDecoration(
                            labelText: 'Email', errorText: snapshot.error),
                      ),
                    );
                  })),
          Container(
            child: StreamBuilder(
              stream: myBloc.password,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return TextField(
                  decoration: InputDecoration(
                      labelText: 'Password', errorText: snapshot.error),
                  obscureText: true,
                  onChanged: myBloc.onPasswordChanged,
                );
              },
            ),

          ),

          Container(
            margin: EdgeInsets.only(top: 24),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[_loginButton(), _toSignUpScreen(context)],
              )
            ],
          )
        ],
      ),
    );
  }


  Widget _loginButton() {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: StreamBuilder<bool>(
        stream: myBloc.registerValid,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return RaisedButton(
            child: Text(StringConstant.login),
            textColor: Colors.white,
            color: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(8.0)),
            onPressed: (snapshot.hasData && snapshot.data == true)
                ? () {
                    myBloc.emitEvent(AuthenticationEventLogin(name: 'idk'));
                  }
                : null,
          );
        },
      ),
    );
  }

  Widget _toSignUpScreen(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: InkWell(
        child: new RichText(
          text: new TextSpan(
            text: null,
            style: TextStyle(fontSize: 16.0, color: Colors.grey),
            children: <TextSpan>[
              new TextSpan(
                text: 'Dont have an account? ',
              ),
              new TextSpan(
                  text: 'Sign up',
                  style: new TextStyle(
                      // color: Colors.black87,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegistrationPage()),
          );
        },
      ),
    );
  }
}
