import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flame/collisions.dart';

import 'components/player.dart';
import 'components/obstacle.dart';

class IffarixRunnerGame extends FlameGame
    with TapCallbacks, KeyboardEvents {
  late Player player;

  @override
  Future<void> onLoad() async {
    add(ScreenHitbox());
    super.onLoad();

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

    // First Obstacle
    add(Obstacle());

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