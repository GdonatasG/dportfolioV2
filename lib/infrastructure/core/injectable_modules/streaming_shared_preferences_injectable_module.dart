import 'package:injectable/injectable.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

@module
abstract class StreamingSharedPreferencesInjectableModule {
  @preResolve
  Future<StreamingSharedPreferences> get preferences async =>
      StreamingSharedPreferences.instance;
}
