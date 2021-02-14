part of 'wrapper_bloc.dart';

@freezed
abstract class WrapperState with _$WrapperState {
  const factory WrapperState.initial() = Initial;
  const factory WrapperState.tutorial() = Tutorial;
  const factory WrapperState.afterTutorial() = AfterTutorial;
}
