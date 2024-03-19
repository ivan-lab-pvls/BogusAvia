import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skypilot_app/services/shared_preferences.dart';

part 'coins_event.dart';
part 'coins_state.dart';

class CoinsBloc extends Bloc<CoinsEvent, CoinsState> {
  CoinsBloc() : super(CoinsInitial()) {
    on<GetCoinsEvent>(_getCoinsHandler);
    on<IncrementCoinsEvent>(_incrementCoinsHandler);
    on<DecrementCoinsEvent>(_decrementCoinsHandler);
  }

  void _getCoinsHandler(
      GetCoinsEvent event, Emitter<CoinsState> emit) async {
    SharedPreferencesService storage =
    await SharedPreferencesService.getInstance();

    emit(LoadedCoinsState(coins: storage.coins));
  }

  void _incrementCoinsHandler(
      IncrementCoinsEvent event, Emitter<CoinsState> emit) async {
    SharedPreferencesService storage =
    await SharedPreferencesService.getInstance();

    storage.coins += event.coins;
  }

  void _decrementCoinsHandler(
      DecrementCoinsEvent event, Emitter<CoinsState> emit) async {
    SharedPreferencesService storage =
    await SharedPreferencesService.getInstance();

    if (storage.coins < event.coins) {
      storage.coins = 0;
    }
    storage.coins -= event.coins;
  }
}
