import 'package:bloc_test/bloc_test.dart';
import 'package:dportfolio_v2/application/wrapper_bloc/wrapper_bloc.dart';
import 'package:dportfolio_v2/presentation/wrapper/wrapper_constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../../utils/general_mocks/mock_shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WrapperBloc? wrapperBloc;

  group(
    'wrapper_bloc_events',
    () {
      late MockSharedPreferences delegate;
      late StreamingSharedPreferences preferences;

      setUp(
        () async {
          delegate = MockSharedPreferences();

          // Swap the instance obtainer with one that always returns a mocked version
          // of shared preferences.
          debugObtainSharedPreferencesInstance = Future.value(delegate);
          preferences = await StreamingSharedPreferences.instance;

          wrapperBloc = WrapperBloc(preferences);
        },
      );

      setUpAll(
        () {
          const channel =
              MethodChannel('plugins.flutter.io/shared_preferences');
          channel.setMockMethodCallHandler((call) async {
            return call.method == 'getAll' ? {} : null;
          });
        },
      );

      tearDown(() {
        debugResetStreamingSharedPreferencesInstance();
      });

      group('tutorialCheckRequest', () {
        blocTest<WrapperBloc, WrapperState>(
          'when [showTutorial] value from SharedPreferences is empty, '
          '[WrapperBloc] should emit [WrapperState.tutorial], '
          'because of set [defaultValue: true] when getting value',
          build: () {
            return wrapperBloc!;
          },
          act: (bloc) => bloc.add(
            const WrapperEvent.tutorialCheckRequest(),
          ),
          expect: () => [
            const WrapperState.tutorial(),
          ],
          verify: (_) {
            verify(
              () => preferences
                  .getBool(
                    WrapperConst.SHOW_TUTORIAL,
                    defaultValue: true,
                  )
                  .getValue(),
            ).called(1);
          },
        );

        blocTest<WrapperBloc, WrapperState>(
          'when [showTutorial] value from SharedPreferences is true, '
          '[WrapperBloc] should emit [WrapperState.tutorial]',
          build: () {
            when(
              () => preferences
                  .getBool(
                    WrapperConst.SHOW_TUTORIAL,
                    defaultValue: true,
                  )
                  .getValue(),
            ).thenAnswer((invocation) => true);

            return wrapperBloc!;
          },
          act: (bloc) => bloc.add(
            const WrapperEvent.tutorialCheckRequest(),
          ),
          expect: () => [
            const WrapperState.tutorial(),
          ],
          verify: (_) {
            verify(
              () => preferences
                  .getBool(
                    WrapperConst.SHOW_TUTORIAL,
                    defaultValue: true,
                  )
                  .getValue(),
            ).called(1);
          },
        );

        blocTest<WrapperBloc, WrapperState>(
          'when [showTutorial] value from SharedPreferences is false, '
          '[WrapperBloc] should emit [WrapperState.afterTutorial]',
          build: () {
            when(
              () => preferences
                  .getBool(
                    WrapperConst.SHOW_TUTORIAL,
                    defaultValue: true,
                  )
                  .getValue(),
            ).thenAnswer((invocation) => false);

            return wrapperBloc!;
          },
          act: (bloc) => bloc.add(
            const WrapperEvent.tutorialCheckRequest(),
          ),
          expect: () => [
            const WrapperState.afterTutorial(),
          ],
          verify: (_) {
            verify(
              () => preferences
                  .getBool(
                    WrapperConst.SHOW_TUTORIAL,
                    defaultValue: true,
                  )
                  .getValue(),
            ).called(1);
          },
        );
      });

      group('tutorialCompleted', () {
        blocTest<WrapperBloc, WrapperState>(
          'when calling this event, '
          '[showTutorial] SharedPreference value should be changed to false',
          build: () {
            when(
              () => preferences.setBool(
                WrapperConst.SHOW_TUTORIAL,
                false,
              ),
            ).thenAnswer(
              (invocation) async => /* update is successful --> */ true,
            );

            return wrapperBloc!;
          },
          act: (bloc) => bloc.add(
            const WrapperEvent.tutorialCompleted(),
          ),
          verify: (_) {
            verify(
              () => preferences.setBool(
                WrapperConst.SHOW_TUTORIAL,
                false,
              ),
            ).called(1);
          },
        );
      });
    },
  );
}
