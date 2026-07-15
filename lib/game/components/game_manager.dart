import 'package:flutter/foundation.dart';

class GameManager {
  static final GameManager instance = GameManager._internal();

  GameManager._internal();

  int score = 0;
  int coins = 0;
  int lives = 3;
  bool isGameOver = false;

  // Score
  void addScore([int value = 1]) {
    if (isGameOver) return;

    score += value;
    debugPrint("Score: $score");
  }

  // Coins
  void addCoin() {
    if (isGameOver) return;

    coins++;
    debugPrint("Coins: $coins");
  }

  // Player Hit
  void loseLife() {
    if (isGameOver) return;

    if (lives > 0) {
      lives--;
    }

    debugPrint("Lives: $lives");

    if (lives <= 0) {
      gameOver();
    }
  }

  // Game Over
  void gameOver() {
    isGameOver = true;
    debugPrint("========== GAME OVER ==========");
  }

  // Restart Game
  void restart() {
    score = 0;
    coins = 0;
    lives = 3;
    isGameOver = false;

    debugPrint("Game Restarted");
  }
}