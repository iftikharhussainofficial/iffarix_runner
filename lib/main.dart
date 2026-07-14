import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'game/iffarix_runner_game.dart';

void main() {
  runApp(
    GameWidget(
      game: IffarixRunnerGame(),
    ),
  );
}