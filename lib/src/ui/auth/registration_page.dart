import 'package:flutter/material.dart';
import 'package:kwizny/src/blocs/reg_form_bloc.dart';

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
    return Scaffold(
      body: Form(
        child: Column(
          children: <Widget>[
            Card(
              child: StreamBuilder<String>(
                  stream: _registrationFormBloc.email,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    return TextField(
                      decoration: InputDecoration(
                        labelText: 'email',
                        errorText: snapshot.error,
                      ),
                      onChanged: _registrationFormBloc.onEmailChanged,
                      keyboardType: TextInputType.emailAddress,
                    );
                  }),
            ),
            Card(
              child: StreamBuilder<String>(
                  stream: _registrationFormBloc.password,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    return TextField(
                      decoration: InputDecoration(
                        labelText: 'password',
                        errorText: snapshot.error,
                      ),
                      obscureText: false,
                      onChanged: _registrationFormBloc.onPasswordChanged,
                    );
                  }),
            ),
            Card(
              child: StreamBuilder<String>(
                  stream: _registrationFormBloc.confirmPassword,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    return TextField(
                      decoration: InputDecoration(
                        labelText: 'retype password',
                        errorText: snapshot.error,
                      ),
                      obscureText: false,
                      onChanged: _registrationFormBloc.onRetypePasswordChanged,
                    );
                  }),
            ),
            Card(
              child: StreamBuilder<bool>(
                  stream: _registrationFormBloc.registerValid,
                  builder:
                      (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    return RaisedButton(
                      child: Text('Register'),
                      onPressed: (snapshot.hasData && snapshot.data == true)
                          ? () {
                            _registrationFormBloc.submit();
                              // launch the registration process
                              // maybe confirm
                            }
                          : null,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}