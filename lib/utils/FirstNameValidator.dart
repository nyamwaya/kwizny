import 'dart:async';

class NameValidator {
  final StreamTransformer<String, String> validateName =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.isEmpty || name == null) {
      sink.addError('Name Cannot be empty');
    } else {
      sink.add(name);
    }
  });
}
