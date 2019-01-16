import 'package:kwizny/src/blocs/bloc_event_state.dart';
import 'package:meta/meta.dart';

/// This class will provide the information related to the authentication process.
/// a little vauge but better than nothing. Future aleckson, help me out here.
/// https://www.didierboelens.com/2018/12/reactive-programming---streams---bloc---practical-use-cases/
class AuthenticationState extends BlocState {
  AuthenticationState({
    @required this.isAuthenticated,
    this.isAuthenticating: false,
    this.hasFailed: false,
    this.name: '',
  });

  final bool isAuthenticated;
  final bool isAuthenticating;
  final bool hasFailed;

  final String name;
  
  factory AuthenticationState.notAuthenticated() {
    return AuthenticationState(
      isAuthenticated: false,
    );
  }

  factory AuthenticationState.authenticated(String name) {
    return AuthenticationState(
      isAuthenticated: true,
      name: name,
    );
  }

  factory AuthenticationState.authenticating() {
    return AuthenticationState(
      isAuthenticated: false,
      isAuthenticating: true,
    );
  }

  factory AuthenticationState.failure() {
    return AuthenticationState(
      isAuthenticated: false,
      hasFailed: true,
    );
  }
}