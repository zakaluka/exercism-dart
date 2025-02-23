import 'dart:math';

enum Classification { perfect, abundant, deficient }

class PerfectNumbers {
  Classification classify(int n) {
    if (n <= 0) throw ArgumentError();

    var s = factors(n);
    var s_sum = s.fold(0, (acc, e) => acc + e);

    if (n == s_sum)
      return Classification.perfect;
    else if (n < s_sum)
      return Classification.abundant;
    else
      return Classification.deficient;
  }

  Set<int> factors(N) {
    Set<int> result = {};

    for (int i = 1; i <= sqrt(N); i++) {
      if (N % i == 0) {
        result.add(i);
        result.add((N / i).floor());
      }
    }

    result.remove(N);
    return result;
  }
}
