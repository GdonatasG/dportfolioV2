import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'wrapper_event.dart';

part 'wrapper_state.dart';

part 'wrapper_bloc.freezed.dart';

@injectable
class WrapperBloc extends Bloc<WrapperEvent, WrapperState> {
  WrapperBloc() : super(const WrapperState.initial()) {
    on<WrapperEvent>((event, emit) async {
      event.map(
        tutorialCheckRequest: (e) async {
          /*final showTutorial = PrefService.getBool(WrapperConst.SHOW_TUTORIAL);
        if (showTutorial == null || showTutorial) {
          yield const WrapperState.tutorial();
        } else {
          yield const WrapperState.afterTutorial();
        }*/
          emit(const WrapperState.afterTutorial());
        },
        tutorialCompleted: (e) async {
          //PrefService.setBool(WrapperConst.SHOW_TUTORIAL, false);
        },
      );
    });
  }

/*@override
  Stream<WrapperState> mapEventToState(
    WrapperEvent event,
  ) async* {
    yield* event.map(
      tutorialCheckRequest: (e) async* {
        /*final showTutorial = PrefService.getBool(WrapperConst.SHOW_TUTORIAL);
        if (showTutorial == null || showTutorial) {
          yield const WrapperState.tutorial();
        } else {
          yield const WrapperState.afterTutorial();
        }*/
        yield const WrapperState.afterTutorial();
      },
      tutorialCompleted: (e) async* {
        //PrefService.setBool(WrapperConst.SHOW_TUTORIAL, false);
      },
    );
  }*/
}
