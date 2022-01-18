import 'package:flutter/foundation.dart';
import 'package:mocktail/mocktail.dart';

class MockValueNotifier<T> extends Mock
    implements ValueNotifier<T>, ValueListenable<T> {
  MockValueNotifier(this._value);

  @override
  T get value => _value;
  T _value;

  @override
  set value(T newValue) {
    if (_value == newValue) {
      return;
    }
    _value = newValue;
    notifyListeners();
  }
}
