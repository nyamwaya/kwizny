import 'package:kwizny/src/bloc_helpers/bloc_event_state.dart';

/// Not sure what this event does
/// future aleckson, I hope you would have figured it out.

abstract class AuthenticationEvent extends BlocEvent {
  final String name;

  AuthenticationEvent({
    this.name: '',
  });
}

class AuthenticationEventLogin extends AuthenticationEvent {
  AuthenticationEventLogin({
    String name,
  }) : super(
    name: name,
  );
}

class AuthenticationEventLogout extends AuthenticationEvent {}