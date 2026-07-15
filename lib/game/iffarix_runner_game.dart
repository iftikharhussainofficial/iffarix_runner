import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/player.dart';
import 'components/obstacle.dart';
import 'components/score_text.dart';
import 'components/coin_manager.dart';
import 'components/hud.dart';

class IffarixRunnerGame extends FlameGame
    with TapCallbacks, KeyboardEvents {
  late Player player;
  late ScoreText scoreText;
  late Hud hud;

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
    add(Obstacle());

    // Coin Manager
    add(CoinManager());

    // Score
    scoreText = ScoreText();
    add(scoreText);

    // HUD
    hud = Hud();
    add(hud);

    debugPrint("IFFARIX Runner Loaded");
  }

  @override
  void onTapDown(TapDownEvent event) {
    player.jump();
  }

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    if (keysPressed.contains(LogicalKeyboardKey.space)) {
      player.jump();
    }

    return KeyEventResult.handled;
  }
}