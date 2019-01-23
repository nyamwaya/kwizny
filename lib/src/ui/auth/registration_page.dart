import 'package:flutter/material.dart';
import 'package:kwizny/src/blocs/reg_form_bloc.dart';
import 'package:kwizny/src/ui/auth/auth_page.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  RegistrationFormBloc _registrationFormBloc;

  @override
  void initState() {
    super.initState();
    _registrationFormBloc = RegistrationFormBloc();
  }

  @override
  void dispose() {
    _registrationFormBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[_logo(), _greeting(), _regForm()],
        ),
      )),
    );
  }

  Widget _logo() {
   return Container(
     padding: EdgeInsets.only(top: 16),
      child:  Column(
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

  Widget _greeting() {
    return Container(
        // height: double.,
        padding: EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Ready to eat?",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3e4564)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                "Sign up to continue",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }

  Widget _regForm() {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Form(
        child: Column(
          children: <Widget>[
            Container(child: StreamBuilder<String>(
                // stream: _registrationFormBloc.firstName, add first name validation to the field
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
              return TextField(
                decoration: InputDecoration(
                  labelText: "First Name",
                  errorText: snapshot.error,
                ),
                onChanged: _registrationFormBloc.onFirstNameChanged,
                keyboardType: TextInputType.text,
              );
            })),
            Container(
              child: StreamBuilder<String>(
                  stream: _registrationFormBloc.email,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    return TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        errorText: snapshot.error,
                      ),
                      onChanged: _registrationFormBloc.onEmailChanged,
                      keyboardType: TextInputType.emailAddress,
                    );
                  }),
            ),
            Container(
              child: StreamBuilder<String>(
                  stream: _registrationFormBloc.password,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    return TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        errorText: snapshot.error,
                      ),
                      obscureText: false,
                      onChanged: _registrationFormBloc.onPasswordChanged,
                    );
                  }),
            ),
            Container(
              child: StreamBuilder<String>(
                  stream: _registrationFormBloc.confirmPassword,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    return TextField(
                      decoration: InputDecoration(
                        labelText: 'Confirm password',
                        errorText: snapshot.error,
                      ),
                      obscureText: false,
                      onChanged: _registrationFormBloc.onRetypePasswordChanged,
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: StreamBuilder<bool>(
                          stream: _registrationFormBloc.registerValid,
                          builder: (BuildContext context,
                              AsyncSnapshot<bool> snapshot) {
                            return RaisedButton(
                              child: Text('Sign up'),
                              elevation: 6,
                              textColor: Colors.white,
                              splashColor: Color(0xff192865),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              onPressed:
                                  (snapshot.hasData && snapshot.data == true)
                                      ? () {
                                          _registrationFormBloc.submit();
                                          // launch the registration process
                                          // maybe confirm
                                        }
                                      : null,
                            );
                          }),
                    ),
                    _alreadyHaveAnAccount(),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding _alreadyHaveAnAccount() {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: InkWell(
        child: new RichText(
          text: new TextSpan(
            text: null,
            style: TextStyle(fontSize: 16.0, color: Colors.grey),
            children: <TextSpan>[
              new TextSpan(
                text: 'Already have an account? ',
              ),
              new TextSpan(
                  text: 'Login',
                  style: new TextStyle(
                      // color: Colors.black87,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AuthenticationPage()),
          );
        },
      ),
    );
  }
}
