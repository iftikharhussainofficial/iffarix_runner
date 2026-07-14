import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/collisions.dart';

class Obstacle extends PositionComponent with CollisionCallbacks {
  final double speed = 250;

  Obstacle();

  @override
  Future<void> onLoad() async {
    size = Vector2(50, 80);

    // Ground ke upar obstacle
    position = Vector2(900, 360);

    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.x -= speed * dt;

    // Screen ke bahar jaye to dobara right side se aaye
    if (position.x < -size.x) {
      position.x = 900;
    }
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = const Color(0xFF1B5E20);
    canvas.drawRect(size.toRect(), paint);
  }
}