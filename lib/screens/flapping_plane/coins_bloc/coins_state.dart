part of 'coins_bloc.dart';

@immutable
abstract class CoinsState {}

class CoinsInitial extends CoinsState {}

class LoadedCoinsState extends CoinsState {
  final double coins;

  LoadedCoinsState({required this.coins});
}
