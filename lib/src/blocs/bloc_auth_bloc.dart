import 'package:kwizny/src/blocs/auth_event_bloc.dart';
import 'package:kwizny/src/blocs/bloc_auth_state.dart';
import 'package:kwizny/src/blocs/bloc_event_state.dart';

///This BLoC is responsible for the handling the authentication process based on events.
///will likely turn this into the login bloc, and create a second one for signup bloc.
///
class AuthenticationBloc
    extends BlocEventStateBase<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : super(
          initialState: AuthenticationState.notAuthenticated(),
        );

  @override
  Stream<AuthenticationState> eventHandler(
      AuthenticationEvent event, AuthenticationState currentState) async* {

    if (event is AuthenticationEventLogin) {
      // Inform that we are proceeding with the authentication
      yield AuthenticationState.authenticating();

      // Simulate a call to the authentication server
      await Future.delayed(const Duration(seconds: 2));

      // Inform that we have successfuly authenticated, or not
      if (event.name == "failure"){
        yield AuthenticationState.failure();
      } else {
        yield AuthenticationState.authenticated(event.name);
      }
    }

    if (event is AuthenticationEventLogout){
      yield AuthenticationState.notAuthenticated();
    }
  }
}