import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'game_manager.dart';

class Hud extends PositionComponent {
  late TextComponent scoreText;
  late TextComponent coinText;
  late TextComponent lifeText;

  @override
  Future<void> onLoad() async {
    scoreText = TextComponent(
      text: '',
      position: Vector2(20, 20),
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    coinText = TextComponent(
      text: '',
      position: Vector2(20, 60),
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.yellow,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    lifeText = TextComponent(
      text: '',
      position: Vector2(20, 100),
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.red,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    add(scoreText);
    add(coinText);
    add(lifeText);
  }

  @override
  void update(double dt) {
    super.update(dt);

    scoreText.text = "Score: ${GameManager.instance.score}";
    coinText.text = "Coins: ${GameManager.instance.coins}";
    lifeText.text = "Lives: ${GameManager.instance.lives}";
  }
}