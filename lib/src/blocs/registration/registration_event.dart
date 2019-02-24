import 'package:kwizny/src/bloc_helpers/bloc_event_state.dart';

class RegistrationEvent extends BlocEvent {
  RegistrationEvent({
    this.event,
    this.name,
    this.email,
    this.password,
    
  });

  final RegistrationEventType event;
  final String email;
  final String password;
  final String name;
}

enum RegistrationEventType {
  none,
  working,
}