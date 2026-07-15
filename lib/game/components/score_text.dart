import 'package:flame/components.dart';

class ScoreText extends TextComponent {
  int score = 0;

  @override
  Future<void> onLoad() async {
    position = Vector2(20, 20);
    text = "Score: 0";
    priority = 100;
  }

  void increase() {
    score++;
    text = "Score: $score";
  }
}