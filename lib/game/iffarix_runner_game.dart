import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/player.dart';
import 'components/obstacle.dart';
import 'components/score_text.dart';
import 'components/game_manager.dart';

class IffarixRunnerGame extends FlameGame
    with TapCallbacks, KeyboardEvents {

  late Player player;
  late ScoreText scoreText;
  late Obstacle obstacle;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(ScreenHitbox());

    // Sky
    add(
      RectangleComponent(
        size: size,
        paint: Paint()..color = const Color(0xFF87CEEB),
      ),
    );

    // Ground
    add(
      RectangleComponent(
        position: Vector2(0, size.y - 100),
        size: Vector2(size.x, 100),
        paint: Paint()..color = const Color(0xFF4CAF50),
      ),
    );

    // Player
    player = Player();
    add(player);

    // Obstacle
    obstacle = Obstacle();
    add(obstacle);

    // Score
    scoreText = ScoreText();
    add(scoreText);

    debugPrint("IFFARIX Runner Loaded");
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (GameManager.instance.isGameOver) {
      return;
    }

    // Collision Check
    if (player.toRect().overlaps(obstacle.toRect())) {
      GameManager.instance.gameOver();
      debugPrint("GAME OVER");
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    if (!GameManager.instance.isGameOver) {
      player.jump();
    }
  }

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    if (keysPressed.contains(LogicalKeyboardKey.space)) {
      if (!GameManager.instance.isGameOver) {
        player.jump();
      }
    }

    return KeyEventResult.handled;
  }
}