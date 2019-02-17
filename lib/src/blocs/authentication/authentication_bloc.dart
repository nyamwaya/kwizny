import 'package:kwizny/src/blocs/authentication/authentication_event.dart';
import 'package:kwizny/src/blocs/authentication/authentication_state.dart';
import 'package:kwizny/src/bloc_helpers/bloc_event_state.dart';
import 'package:rxdart/rxdart.dart';
import 'package:kwizny/utils/EmailValidator.dart';
import 'package:kwizny/utils/password_validator.dart';
import 'package:kwizny/src/resources/repository.dart';

///This BLoC is responsible for the handling the authentication process based on events.
///will likely turn this into the login bloc, and create a second one for signup bloc.
///
class AuthenticationBloc extends BlocEventStateBase<AuthenticationEvent, AuthenticationState>
    with EmailValidator, PasswordValidator {
  AuthenticationBloc()
      : super(
          initialState: AuthenticationState.notAuthenticated(),
        );

  final _repository = Repository();
  final BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordController = BehaviorSubject<String>();
  //
  //  Inputs
  //
  Function(String) get onEmailChanged => _emailController.sink.add;
  Function(String) get onPasswordChanged => _passwordController.sink.add;

  //
  // Validators
  //
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  // Registration button
  Stream<bool> get registerValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  //get cuttrent user
  Future<String> get currentUser => _repository.currentuser();

  //signOut Current user
  Future<void> get signOut => _repository.signOut();


  @override
  Stream<AuthenticationState> eventHandler(
      AuthenticationEvent event, AuthenticationState currentState) async* {
    if (event is AuthenticationEventLogin) {
      // Inform that we are proceeding with the authentication
      yield AuthenticationState.authenticating();

      // Make a call to the firebase authentication
      //await Future.delayed(const Duration(seconds: 2));
      try {
        print(
            "Credentials:${_emailController.value} , ${_passwordController.value}");
        await _repository.signInWithEmailAndPasswordilAndPassword(
            _emailController.value, _passwordController.value);
        yield AuthenticationState.authenticated(event.name);
      } catch (e) {
        yield AuthenticationState.failure();
        print("Failed Login: $e");
      }

      // if (await _repository.currentuser() != null) {
      //   yield AuthenticationState.authenticated(event.name);
      // } else {
      //   yield AuthenticationState.failure();
      // }

    } else {
      if (event is AuthenticationEventLogout) {
        await  _repository.signOut();
        yield AuthenticationState.notAuthenticated();
        
      }
    }
  }

  @override
    void dispose() {
      _emailController.close();
      _passwordController.close();
      super.dispose();
    }
}
