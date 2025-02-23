class CollatzConjecture {
  int steps(int n) {
    if (n <= 0) throw ArgumentError('Only positive integers are allowed');
    return stepCounter(0, n);
  }

  int stepCounter(int acc, int n) {
    if (n == 1)
      return acc;
    else if (n % 2 == 0)
      return stepCounter(acc + 1, (n / 2).round());
    else
      return stepCounter(acc + 1, 3 * n + 1);
  }
}
