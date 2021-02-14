import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class CurrentBottomBarPage extends ValueNotifier<int> {
  CurrentBottomBarPage() : super(0);
}
