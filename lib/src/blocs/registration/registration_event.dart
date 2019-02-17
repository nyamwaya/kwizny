import 'package:kwizny/src/bloc_helpers/bloc_event_state.dart';

class RegistrationEvent extends BlocEvent {
  RegistrationEvent({
    this.event,
    this.email,
    this.password,
    this.userName,
  });

  final RegistrationEventType event;
  final String email;
  final String password;
  final String userName;
}

enum RegistrationEventType {
  none,
  working,
}