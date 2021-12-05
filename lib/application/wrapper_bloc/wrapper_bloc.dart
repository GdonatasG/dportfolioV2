import 'package:bloc/bloc.dart';
import 'package:dportfolio_v2/injection.dart';
import 'package:dportfolio_v2/presentation/wrapper/wrapper_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

part 'wrapper_event.dart';

part 'wrapper_state.dart';

part 'wrapper_bloc.freezed.dart';

@injectable
class WrapperBloc extends Bloc<WrapperEvent, WrapperState> {
  WrapperBloc() : super(const WrapperState.initial()) {
    on<WrapperEvent>((event, emit) async {
      event.map(
        tutorialCheckRequest: (e) async {
          final showTutorial = getIt<StreamingSharedPreferences>()
              .getBool(
                WrapperConst.SHOW_TUTORIAL,
                defaultValue: true,
              )
              .getValue();

          if (showTutorial) {
            emit(const WrapperState.tutorial());
          } else {
            emit(const WrapperState.afterTutorial());
          }
        },
        tutorialCompleted: (e) async {
          await getIt<StreamingSharedPreferences>().setBool(
            WrapperConst.SHOW_TUTORIAL,
            false,
          );
        },
      );
    });
  }
}
