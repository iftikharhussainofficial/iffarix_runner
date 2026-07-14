import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/collisions.dart';

class Player extends PositionComponent with CollisionCallbacks {
  final double gravity = 900;
  final double jumpForce = -450;

  double velocityY = 0;
  bool isOnGround = true;

  Player();

  @override
  Future<void> onLoad() async {
    size = Vector2(60, 60);
    position = Vector2(80, 440);

    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    velocityY += gravity * dt;
    position.y += velocityY * dt;

    if (position.y >= 440) {
      position.y = 440;
      velocityY = 0;
      isOnGround = true;
    }
  }

  void jump() {
    if (isOnGround) {
      velocityY = jumpForce;
      isOnGround = false;
    }
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = Colors.red;
    canvas.drawRect(size.toRect(), paint);
  }
}