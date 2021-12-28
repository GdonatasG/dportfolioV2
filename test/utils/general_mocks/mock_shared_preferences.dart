import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {
  @override
  Set<String> getKeys() {
    return super.noSuchMethod(
      Invocation.method(#getKeys, []),
    );
  }

  @override
  String? getString(String? key) =>
      super.noSuchMethod(Invocation.method(#getString, [key]));

  @override
  Future<bool> setBool(String? key, bool? value) {
    return super.noSuchMethod(
      Invocation.method(#setBool, [key, value]),
    );
  }

  @override
  Future<bool> setInt(String? key, int? value) {
    return super.noSuchMethod(
      Invocation.method(#setInt, [key, value]),
    );
  }

  @override
  Future<bool> setDouble(String? key, double? value) {
    return super.noSuchMethod(
      Invocation.method(#setDouble, [key, value]),
    );
  }

  @override
  Future<bool> setString(String? key, String? value) {
    return super.noSuchMethod(
      Invocation.method(#setString, [key, value]),
    );
  }

  @override
  Future<bool> setStringList(String? key, List<String>? value) {
    return super.noSuchMethod(
      Invocation.method(#setStringList, [key, value]),
    );
  }

  @override
  Future<bool> remove(String? key) {
    return super.noSuchMethod(
      Invocation.method(#remove, [key]),
    );
  }

  @override
  Future<bool> clear() {
    return super.noSuchMethod(
      Invocation.method(#clear, []),
    );
  }
}
