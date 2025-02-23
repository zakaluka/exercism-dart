import 'dart:math';

class Allergies {
  // https://www.geeksforgeeks.org/highest-power-2-less-equal-given-number/
  int highestPowerOf2(int n) {
    var x = n;

    x |= x >> 1;
    x |= x >> 2;
    x |= x >> 4;
    x |= x >> 8;
    x |= x >> 16;

    return x ^ (x >> 1);
  }

  final allergens = [
    'eggs',
    'peanuts',
    'shellfish',
    'strawberries',
    'tomatoes',
    'chocolate',
    'pollen',
    'cats',
  ];

  List<String> list(int n) {
    var x = n;
    var res = <String>[];

    while (x > 0) {
      var p2 = highestPowerOf2(x);
      print('p2: ' + p2.toString());
      var p2exp = (log(p2) / log(2)).round();
      print('p2exp: ' + p2exp.toString());

      // If the allergen is in the list, add it.
      if (p2exp + 1 <= allergens.length) res.add(allergens[p2exp]);

      // reduce the remaining number;
      x -= p2;
    }

    return res.reversed.toList();
  }

  bool allergicTo(String s, int n) {
    var allAllergies = list(n);

    return allAllergies.contains(s);
  }
}
