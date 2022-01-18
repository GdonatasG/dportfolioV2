import 'package:bloc_test/bloc_test.dart';
import 'package:dportfolio_v2/application/wrapper_bloc/wrapper_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockWrapperBloc extends MockBloc<WrapperEvent, WrapperState>
    implements WrapperBloc {}

class FakeWrapperState extends Fake implements WrapperState {}
