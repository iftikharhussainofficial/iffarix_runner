import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Coin extends PositionComponent {
  final double speed = 250;

  Coin();

  @override
  Future<void> onLoad() async {
    size = Vector2(35, 35);
    position = Vector2(900, 250);
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.x -= speed * dt;

    if (position.x < -size.x) {
      position.x = 900;
    }
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()
      ..color = const Color(0xFFFFD700);

    canvas.drawCircle(
      Offset(size.x / 2, size.y / 2),
      size.x / 2,
      paint,
    );
  }
}