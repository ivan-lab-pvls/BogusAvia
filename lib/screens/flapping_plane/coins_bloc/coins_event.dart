part of 'coins_bloc.dart';

@immutable
abstract class CoinsEvent {}

class GetCoinsEvent extends CoinsEvent {}

class IncrementCoinsEvent extends CoinsEvent {
  final double coins;

  IncrementCoinsEvent({required this.coins});
}

class DecrementCoinsEvent extends CoinsEvent {
  final int coins;

  DecrementCoinsEvent({required this.coins});
}
