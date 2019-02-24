import 'package:flutter/material.dart';
import 'package:kwizny/src/bloc_widgets/bloc_state_builder.dart';
import 'package:kwizny/src/blocs/registration/reg_form_bloc.dart';
import 'package:kwizny/src/blocs/registration/registration_bloc.dart';
import 'package:kwizny/src/blocs/registration/registration_event.dart';
import 'package:kwizny/src/blocs/registration/registration_state.dart';
import 'package:kwizny/src/ui/auth/login_page.dart';
import 'package:kwizny/src/ui/home/home_page.dart';
import 'package:kwizny/src/widgets/pending_action.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  TextEditingController _firstNameController;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _retypeController;
  RegistrationFormBloc _registrationFormBloc;
  RegistrationBloc _registrationBloc;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _retypeController = TextEditingController();
    _registrationFormBloc = RegistrationFormBloc();
    _registrationBloc = RegistrationBloc();
  }

  @override
  void dispose() {
    _firstNameController?.dispose();
    _registrationBloc?.dispose();
    _registrationFormBloc?.dispose();
    _emailController?.dispose();
    _passwordController?.dispose();
    _retypeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocEventStateBuilder<RegistrationState>(
        bloc: _registrationBloc,
        builder: (BuildContext context, RegistrationState state) {
          if (state.isBusy) {
            return PendingAction();
          } else if (state.isSuccess) {
            return _buildSuccess();
          } else if (state.isFailure) {
            return _buildFailure();
          }
          return _buildForm();
        });
  }

  _buildSuccess() {
    // root screen
    print('Registration Success ');
    return HomePage();
//      return _redirectToPage(context, HomePage());
  }

  Widget _buildFailure() {
    return Center(
      child: Text('Registration Failure'),
    );
  }

  Widget _space() {
    return Container(padding: EdgeInsets.all(32));
  }

  Widget _buildForm() {
    return SafeArea(
      child: Scaffold(
          body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[_space(), _greeting(), _regForm()],
        ),
      )),
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
                controller: _firstNameController,
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
                      controller: _emailController,
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
                      controller: _passwordController,
                      obscureText: true,
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
                      controller: _retypeController,
                      obscureText: true,
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
                              color: Colors.red,
                              elevation: 6,
                              textColor: Colors.white,
                              splashColor: Color(0xff192865),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              onPressed: (snapshot.hasData &&
                                      snapshot.data == true)
                                  ? () {
                                      _registrationBloc.emitEvent(
                                          RegistrationEvent(
                                              event:
                                                  RegistrationEventType.working,
                                              name: _firstNameController.text,
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text));
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
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
      ),
    );
  }
}
