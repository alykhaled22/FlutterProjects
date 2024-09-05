import 'package:basketball_app/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState());

  int teamAPoints = 0;
  int teamBPoints = 0;

  void teamAIncrement(int buttonNum) {
    teamAPoints += buttonNum;
    emit(ACounterIncrementState());
  }

  void teamBIncrement(int buttonNum) {
    teamBPoints += buttonNum;
    emit(BCounterIncrementState());
  }

  void resetCounter() {
    teamAPoints = 0;
    teamBPoints = 0;
    emit(ResetCounterState());
  }
}
