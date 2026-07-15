import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Coin extends PositionComponent with CollisionCallbacks {
  final double speed = 250;

  Coin();

  @override
  Future<void> onLoad() async {
    size = Vector2(35, 35);

    // Coin hawa mein hoga
    position = Vector2(900, 250);

    // Collision
    add(CircleHitbox());

    await super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.x -= speed * dt;

    // Screen se bahar jaye to dobara right side se aa jaye
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