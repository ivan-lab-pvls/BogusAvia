import 'package:skypilot_app/screens/puzzle/models/puzzle_model.dart';
import 'package:skypilot_app/screens/puzzle/models/puzzle_pieces_model.dart';

final List<PuzzleModel> puzzleRepository = [
  PuzzleModel(
      title: 'The hand with the airplane',
      image: 'assets/images/puzzle/1/full-1.png',
      number: 0,
      puzzlePieces: List<PuzzlePieceModel>.generate(
          16,
          (i) => PuzzlePieceModel(
              index: i, pieces: 'assets/images/puzzle/1/${i + 1}.png'))),
  PuzzleModel(
      title: 'Airplane wing',
      image: 'assets/images/puzzle/2/full-2.png',
      number: 1,
      puzzlePieces: List<PuzzlePieceModel>.generate(
          16,
          (i) => PuzzlePieceModel(
              index: i, pieces: 'assets/images/puzzle/2/${i + 1}.png'))),
  PuzzleModel(
      title: 'The window of an airplane',
      image: 'assets/images/puzzle/3/full-3.png',
      number: 2,
      puzzlePieces: List<PuzzlePieceModel>.generate(
          16,
          (i) => PuzzlePieceModel(
              index: i, pieces: 'assets/images/puzzle/3/${i + 1}.png'))),
  PuzzleModel(
      title: 'A toy model airplane',
      image: 'assets/images/puzzle/4/full-4.png',
      number: 3,
      puzzlePieces: List<PuzzlePieceModel>.generate(
          16,
          (i) => PuzzlePieceModel(
              index: i, pieces: 'assets/images/puzzle/4/${i + 1}.png'))),
  PuzzleModel(
      title: 'An airplane in flight',
      image: 'assets/images/puzzle/5/full-5.png',
      number: 4,
      puzzlePieces: List<PuzzlePieceModel>.generate(
          16,
          (i) => PuzzlePieceModel(
              index: i, pieces: 'assets/images/puzzle/5/${i + 1}.png'))),
  PuzzleModel(
      title: 'Airplane',
      image: 'assets/images/puzzle/6/full-6.png',
      number: 5,
      puzzlePieces: List<PuzzlePieceModel>.generate(
          16,
          (i) => PuzzlePieceModel(
              index: i, pieces: 'assets/images/puzzle/6/${i + 1}.png'))),
];
