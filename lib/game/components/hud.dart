import 'package:flame/components.dart';

class Hud extends PositionComponent {
  int score = 0;
  int coins = 0;
  int lives = 3;

  late TextComponent scoreText;
  late TextComponent coinText;
  late TextComponent lifeText;

  @override
  Future<void> onLoad() async {
    scoreText = TextComponent(
      text: 'Score: $score',
      position: Vector2(20, 20),
    );

    coinText = TextComponent(
      text: 'Coins: $coins',
      position: Vector2(20, 50),
    );

    lifeText = TextComponent(
      text: 'Lives: $lives',
      position: Vector2(20, 80),
    );

    add(scoreText);
    add(coinText);
    add(lifeText);
  }

  void addScore() {
    score++;
    scoreText.text = 'Score: $score';
  }

  void addCoin() {
    coins++;
    coinText.text = 'Coins: $coins';
  }

  void loseLife() {
    if (lives > 0) {
      lives--;
      lifeText.text = 'Lives: $lives';
    }
  }
}