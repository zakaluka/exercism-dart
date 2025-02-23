class SumOfMultiples {
  int sum(List<int> items, int lvl) {
    Set<int> x = Set();

    // add all multiples into a set.
    items.where((el) => el > 0).forEach((el) => x.addAll(multiples(el, lvl)));

    return x.fold(0, (acc, el) => acc + el);
  }

  List<int> multiples(int start, int max) {
    var res = <int>[];

    int multiplier = 1;

    while (start * multiplier < max) {
      res.add(start * multiplier);
      multiplier++;
    }

    return res;
  }
}
