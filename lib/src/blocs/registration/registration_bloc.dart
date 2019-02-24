import 'dart:async';

import 'package:kwizny/src/bloc_helpers/bloc_event_state.dart';
import 'package:kwizny/src/blocs/registration/registration_event.dart';
import 'package:kwizny/src/blocs/registration/registration_state.dart';
import 'package:kwizny/src/resources/repository.dart';

class RegistrationBloc
    extends BlocEventStateBase<RegistrationEvent, RegistrationState> {
  RegistrationBloc()
      : super(
          initialState: RegistrationState.noAction(),
        );
  final _repository = Repository();

  void myName(String name, String email, String userID) async {
    //  await _repository.createUserWithEmailAndPassword(
    //       email, password).then(value = userId);
    print('The user is $userID');

    await _repository.createUserProfile(name, email, userID);
  }

  @override
  Stream<RegistrationState> eventHandler(
      RegistrationEvent event, RegistrationState currentState) async* {
    if (event.event == RegistrationEventType.working) {
      yield RegistrationState.busy();

      print('Registration of ${event.email}/${event.password}');

      // make a call to firebase auth
      try {
        await _repository
            .createUserWithEmailAndPassword(event.email, event.password)
            .then((value) {
          myName(event.name, event.email, value);
        });

        yield RegistrationState.success();
      } catch (e) {
        yield RegistrationState.failure();
        print("Failed Registration: $e");
      }
    }
  }
}
