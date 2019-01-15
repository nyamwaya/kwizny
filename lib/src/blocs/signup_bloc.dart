import 'package:kwizny/src/blocs/bloc_base.dart';
import 'package:kwizny/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'package:kwizny/utils/StringConstant.dart';

/*
* This bloc will be handling our business logics for signing up. 
* It will act as a controller between Signup form and the data layer(repository). 
* For example: email and password validation logic will be written here.
*/

class SignUpBloc implements BlocBase {
  final _repository = Repository();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _isSignedUp = BehaviorSubject<bool>();

  Observable<String> get email => _email.stream.transform(_validateEmail);

  Observable<String> get password =>
      _password.stream.transform(_validatePassword);

  Observable<bool> get signUpStatus => _isSignedUp.stream;

  String get emailAddress => _email.value;

  // Change data
  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;

  Function(bool) get showProgressBar => _isSignedUp.sink.add;

  final _validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError(StringConstant.emailValidateMessage);
    }
  });

  final _validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 6) {
      sink.add(password);
    } else {
      sink.addError(StringConstant.passwordValidateMessage);
    }
  });

  Future<String> submit() {
    return _repository.createUserWithEmailAndPassword(
        _email.value, _password.value);
  }

  /// Don't need this method because of singup bloc...delete this when it makes sence to
  /// Future<void> registerUser() {
  //   return _repository.createUserWithEmailAndPassword(_email.value, _password.value);
  // }

  @override
  void dispose() async {
    await _email.drain();
    _email.close();
    await _password.drain();
    _password.close();
    await _isSignedUp.drain();
    _isSignedUp.close();
  }

  bool validateFields() {
    if (_email.value != null &&
        _email.value.isNotEmpty &&
        _password.value != null &&
        _password.value.isNotEmpty &&
        _email.value.contains('@') &&
        _password.value.length > 3) {
      return true;
    } else {
      return false;
    }
  }
  // final _repository = Repository();
  // final _firstName = BehaviorSubject<String>();
  // final _email = BehaviorSubject<String>();
  // final _password = BehaviorSubject<String>();
  // final _confirmPassword = BehaviorSubject<String>();
  // final _isSignedUp = BehaviorSubject<bool>();

  // Observable<String> get firstName => _firstName.stream;

  // Observable<String> get email => _email.stream.transform(_validateEmail);

  // Observable<String> get password =>
  //     _password.stream.transform(_validatePassword);

  // Observable<String> get confirmPassword =>
  //     _password.stream.transform(_validateConfirmPassword);

  // Observable<bool> get signUpStatus => _isSignedUp.stream;

  // String get emailAddress => _email.value;

  // // Change data...I'm not sure why tho
  // Function(String) get changeFirstName => _firstName.sink.add;

  // Function(String) get changeEmail => _email.sink.add;

  // Function(String) get changePassword => _password.sink.add;

  // Function(String) get changeConfirmPassword => _confirmPassword.sink.add;

  // Function(bool) get showProgressBar => _isSignedUp.sink.add;

  // final _validateEmail =
  //     StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
  //   if (email.contains('@')) {
  //     sink.add(email);
  //   } else {
  //     sink.addError(StringConstant.emailValidateMessage);
  //   }
  // });

  // final _validatePassword = StreamTransformer<String, String>.fromHandlers(
  //     handleData: (password, sink) {
  //   if (password.length > 6) {
  //     sink.add(password);
  //   } else {
  //     sink.addError(StringConstant.passwordValidateMessage);
  //   }
  // });

  // final _validateConfirmPassword =
  //     StreamTransformer<String, String>.fromHandlers(
  //         handleData: (confirmPassword, sink) {
  //   if (confirmPassword.length > 6) {
  //     sink.add(confirmPassword);
  //   } else {
  //     sink.addError(StringConstant.confirmPasswordValidateMessage);
  //   }
  // });

  // Future<String> createUser() {
  //   return _repository.createUserWithEmailAndPassword(
  //       _email.value, _password.value);
  // }

  // @override
  // void dispose() async {
  //   await _firstName.drain();
  //   _firstName.close();
  //   await _email.drain();
  //   _email.close();
  //   await _password.drain();
  //   _password.close();
  //   await _confirmPassword.drain();
  //   _confirmPassword.close();
  //   await _isSignedUp.drain();
  //   _isSignedUp.close();
  // }

  // bool validateFields() {
  //   if (_email.value != null &&
  //       _email.value.isNotEmpty &&
  //       _password.value != null &&
  //       _password.value.isNotEmpty &&
  //       _email.value.contains('@') &&
  //       _password.value.length > 3) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
