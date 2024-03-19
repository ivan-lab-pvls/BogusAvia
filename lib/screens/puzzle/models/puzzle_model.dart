
import 'package:skypilot_app/screens/puzzle/models/puzzle_pieces_model.dart';

class PuzzleModel {
  final String title;
  final String image;
  final int number;
  final List<PuzzlePieceModel> puzzlePieces;

  PuzzleModel({
    required this.image,
    required this.title,
    required this.number,
    required this.puzzlePieces,
  });
}