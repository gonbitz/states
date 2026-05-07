import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // BlocObserver is dev-only tooling; print is intentional here.
    // ignore: avoid_print
    print('[${bloc.runtimeType}] ${change.currentState} → ${change.nextState}');
  }
}
