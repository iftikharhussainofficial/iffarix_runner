import 'package:flame/components.dart';
import 'coin.dart';

class CoinManager extends Component {
  @override
  Future<void> onLoad() async {
    add(Coin());
  }
}