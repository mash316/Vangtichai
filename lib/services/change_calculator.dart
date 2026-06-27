class ChangeCalculator {
  static const List<int> denominations = [500, 100, 50, 20, 10, 5, 2, 1];

  static Map<int, int> calculate(int amount) {
    Map<int, int> result = {};
    int remaining = amount;

    for (int denomination in denominations) {
      if (remaining >= denomination) {
        result[denomination] = remaining ~/ denomination;
        remaining %= denomination;
      } else {
        result[denomination] = 0;
      }
    }

    return result;
  }
}
