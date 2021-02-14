part of 'wrapper_bloc.dart';

@freezed
abstract class WrapperEvent with _$WrapperEvent {
  const factory WrapperEvent.tutorialCheckRequest() = TutorialCheckRequest;
  const factory WrapperEvent.tutorialCompleted() = TutorialCompleted;
}
