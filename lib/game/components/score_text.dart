import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'game_manager.dart';

class ScoreText extends TextComponent {
  @override
  Future<void> onLoad() async {
    position = Vector2(20, 20);
    priority = 100;

    textRenderer = TextPaint(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 28,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    text =
        "Score: ${GameManager.instance.score}\n"
        "Coins: ${GameManager.instance.coins}\n"
        "Lives: ${GameManager.instance.lives}";
  }
}